part of '../general_section.dart';

class SyncDataOnAppStartTile extends ConsumerWidget {
  const SyncDataOnAppStartTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final syncOnStart = ref
        .watch(settingsNotifierProvider.select((value) => value.syncOnStart));

    return SettingToggleTile(
      leading: const Icon(Icons.sync_alt),
      title: S.of(context).syncDataOnAppStart.titleCase,
      subTitle: S.of(context).syncDataOnAppStartSubTitle,
      switchValue: syncOnStart,
      onToggle: (value) {
        ref
            .watch(dialogServiceProvider)
            .showConfirmDialog(
                'Please know this is only required if you have multiple devices.\nKeeping data synced between two devices is challenging and can cause descrepencies and potentially data loss.\n\nAre you sure you want this on?')
            .then((res) {
          if (!res) return;
          ref.watch(settingsNotifierProvider.notifier).updateSettings(
                (e) => e..syncOnStart = value,
              );
        });
      },
    );
  }
}
