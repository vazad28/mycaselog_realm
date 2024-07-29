// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:async';

import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';
import 'sync_providers.dart';
part '../../generated/sync/provider/firestore_live_sync.g.dart';

@Riverpod(keepAlive: true)
class FirestoreLiveSync extends _$FirestoreLiveSync with LoggerMixin {
  Map<String, StreamSubscription> subs = {};

  @override
  bool build() {
    ref
        .watch(dbProvider)
        .settingsCollection
        .getSettings()
        ?.changes
        .listen((settings) {
      if (settings.object.syncOnStart != state) {
        settings.object.syncOnStart
            ? _startFirebaseListeners()
            : _pauseFirebaseListeners();

        state = settings.object.syncOnStart;
      }
    });

    /// on dispose kill all listeners
    ref.onDispose(_stopFirebaseListeners);

    return false;
  }

  void _startFirebaseListeners() {
    logger.fine('starting firebase listeners on Firebase Sync live');
    if (subs.isNotEmpty) return _resumeFirebaseListeners();

    try {
      final collectionsMap = ref.read(syncCollectionsMapProvider);
      for (final dbCollection in collectionsMap.keys) {
        final collection = collectionsMap[dbCollection];
        if (collection == null) continue;

        final stream = collection.listenForChanges();
        if (stream == null) continue;

        // ignore: cancel_subscriptions
        final sub = stream.listen((_) {});
        subs.putIfAbsent(dbCollection.name, () => sub);
      }
    } catch (err) {
      logger.severe('sync listeners error $err');
    }
  }

  void _resumeFirebaseListeners() {
    logger.fine('resumeing firebase listeners on Firebase Sync live');
    for (final sub in subs.values) sub.resume();
  }

  void _pauseFirebaseListeners() {
    logger.fine('pausing firebase listeners on Firebase Sync live');
    for (final sub in subs.values) sub.pause();
  }

  void _stopFirebaseListeners() {
    for (final sub in subs.values) sub.cancel();
    logger.fine('FirestoreLiveSync is disposing');
    subs.clear();
  }
}
