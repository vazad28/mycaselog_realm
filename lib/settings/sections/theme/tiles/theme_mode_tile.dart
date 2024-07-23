part of '../theme_section.dart';

class ThemeModeSettingTile extends ConsumerWidget with SettingsMixin {
  const ThemeModeSettingTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(currentThemeModeProvider);

    return SettingsTile(
      title: S.of(context).switchTheme,
      leading: const Icon(Icons.language),
      trailing: DropdownButton<ThemeMode>(
        value: ThemeMode.values[themeMode],
        underline: const SizedBox.shrink(),
        onChanged: (value) {
          if (value == null) return;
          final themeModeIndex = ThemeMode.values.indexOf(value);
          updateSettings(ref, getSettings(ref)..themeMode = themeModeIndex);
        },
        items: [
          DropdownMenuItem(
            value: ThemeMode.system,
            child: Text(ThemeMode.system.name.titleCase),
          ),
          DropdownMenuItem(
            value: ThemeMode.light,
            child: Text(ThemeMode.light.name.titleCase),
          ),
          DropdownMenuItem(
            value: ThemeMode.dark,
            child: Text(ThemeMode.dark.name.titleCase),
          ),
        ],
      ),
    );
  }
}
