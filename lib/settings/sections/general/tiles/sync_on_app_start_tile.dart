part of '../general_section.dart';

class SyncDataOnAppStartTile extends ConsumerWidget with SettingsMixin {
  const SyncDataOnAppStartTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncOnStart =
        ref.watch(settingsProvider.select((value) => value.syncOnStart));

    return SettingToggleTile(
      leading: const Icon(Icons.sync_alt),
      title: S.of(context).syncDataOnAppStart.titleCase,
      subTitle: S.of(context).syncDataOnAppStartSubTitle,
      switchValue: syncOnStart,
      onToggle: (value) {
        updateSettings(ref, getSettings(ref)..syncOnStart = value);

        /// to see what this setting does go to Sync Feature
        // ref
        //     .watch(settingsProvider.notifier)
        //     .on(SettingsEvent.updatesyncOnStart(value));
      },
    );
  }
}
