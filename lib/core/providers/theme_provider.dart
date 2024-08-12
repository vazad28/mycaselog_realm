part of './providers.dart';

@riverpod
ThemeData currentTheme(CurrentThemeRef ref, BuildContext context) {
  final brightness = View.of(context).platformDispatcher.platformBrightness;
  final themeDataObject = ref.watch(themeNotifierProvider);
  final theme = AppTheme(context, themeDataObject);

  final currentTheme = switch (themeDataObject.themeMode) {
    ThemeMode.system => brightness == Brightness.light
        ? theme.lightTheme()
        : theme.darkTheme().copyWith(
              cupertinoOverrideTheme: const CupertinoThemeData(
                textTheme: CupertinoTextThemeData(), // This is required
              ),
            ),
    ThemeMode.light => theme.lightTheme(),
    ThemeMode.dark => theme.darkTheme().copyWith(
          cupertinoOverrideTheme: const CupertinoThemeData(
            textTheme: CupertinoTextThemeData(), // This is required
          ),
        )
  };
  return currentTheme;
}

@riverpod
class ThemeNotifier extends _$ThemeNotifier {
  @override
  CurrentTheme build() {
    final sharedPrefs = ref.watch(sharedPrefsProvider);

    final themeJson = sharedPrefs.getString('currentTheme');

    if (themeJson != null) {
      final themeMap = jsonDecode(themeJson) as Map<String, dynamic>;
      return CurrentTheme.fromJson(themeMap);
    } else {
      return CurrentTheme(
        themeMode: ThemeMode.system, // Default theme mode
        themeFontStyle: 'normal', // Default font style
        themeContrast: ThemeContrast.normal, // Default contrast
      );
    }
  }

  void setThemeMode(ThemeMode mode) {
    state = state.copyWith(themeMode: mode);
    _saveThemeToSharedPreferences();
  }

  void setThemeFontStyle(String style) {
    state = state.copyWith(themeFontStyle: style);
    _saveThemeToSharedPreferences();
  }

  void setThemeContrast(ThemeContrast contrast) {
    state = state.copyWith(themeContrast: contrast);
    _saveThemeToSharedPreferences();
  }

  Future<void> _saveThemeToSharedPreferences() async {
    final themeJson = jsonEncode(state.toJson());
    final sharedPrefs = ref.watch(sharedPrefsProvider);
    await sharedPrefs.setString('currentTheme', themeJson);
  }
}
