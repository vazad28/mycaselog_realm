part of '../general_section.dart';

class LocalAuthEnabledTile extends ConsumerWidget with SettingsMixin {
  const LocalAuthEnabledTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localAuthEnabled =
        ref.watch(settingsProvider.select((value) => value.localAuthEnabled));

    return SettingToggleTile(
      leading: const Icon(Icons.shield),
      title: S.of(context).localAuth.titleCase,
      subTitle: S.of(context).localAuthSubTitle,
      switchValue: localAuthEnabled,
      onToggle: (value) {
        updateSettings(ref, getSettings(ref)..biometricEnabled);
      },
    );
  }
}
