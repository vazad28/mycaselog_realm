// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:async';

import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';
import 'sync_provider.dart';
part '../../generated/sync/provider/firestore_live_sync.g.dart';

@Riverpod(keepAlive: true)
class FirestoreLiveSync extends _$FirestoreLiveSync with LoggerMixin {
  Map<String, StreamSubscription> subs = {};

  @override
  bool build() {
    final sub = ref
        .watch(dbProvider)
        .settingsCollection
        .getSettings()
        ?.changes
        .listen((settings) {
      if (settings.object.syncOnStart != state) {
        state = settings.object.syncOnStart;
        _updateFirebaseSyncStatus();
      }
    });

    /// on dispose kill all listeners
    ref.onDispose(() => sub?.cancel());

    return false;
  }

  Future<void> _updateFirebaseSyncStatus() async {
    logger.fine('starting firebase listeners on Firebase Sync live');

    try {
      final collectionsMap = ref.read(syncCollectionsMapProvider);
      for (final dbCollection in collectionsMap.keys) {
        final collection = collectionsMap[dbCollection];
        if (collection == null) continue;

        await collection.syncByTimestamp();

        /// TODO
        //collection.updateFirebaseSyncStatus(status: state);
      }
    } catch (err) {
      logger.severe('sync listeners error $err');
    }
  }
}
