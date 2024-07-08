part of '../general_section.dart';

class LocalAuthEnabledTile extends ConsumerWidget {
  const LocalAuthEnabledTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localAuthEnabled = ref
        .watch(appSettingsProvider.select((value) => value.localAuthEnabled));

    return SettingToggleTile(
      leading: const Icon(Icons.shield),
      title: S.of(context).localAuth.titleCase,
      subTitle: S.of(context).localAuthSubTitle,
      switchValue: localAuthEnabled,
      onToggle: (value) {
        /// to see what this setting does go to Sync Feature
        ref
            .watch(appSettingsProvider.notifier)
            .on(SettingsEvent.updateLocalAuthEnabled(value));
      },
    );
  }
}
