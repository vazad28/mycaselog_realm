import 'package:app_annotations/app_annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers/sync_providers.dart';
import '../settings.dart';

class SettingsView extends ConsumerWidget
    with SettingsEventMixin, SettingsStateMixin {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsync = ref.watch(settingsNotifierProvider);

    return Center(
        child: ElevatedButton(
            onPressed: () {
              ref
                  .read(firestoreSyncProvider.notifier)
                  .resetSyncForCollection(DbCollection.cases);
            },
            child: const Text('Reset Cases Sync')));
  }
}
