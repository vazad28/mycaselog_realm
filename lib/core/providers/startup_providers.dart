part of '../app_providers.dart';

@riverpod
Future<void> appStartUp(AppStartUpRef ref) async {
  /// Load realm database
  await ref.watch(realmDatabaseProvider.future);
}

@riverpod
class CurrentThemeMode extends _$CurrentThemeMode {
  final String themeModeKey = '__theme_mode_key__';

  @override
  int build() {
    final sharedPrefs = ref.watch(sharedPrefsProvider);
    final themeMode = sharedPrefs.getInt(themeModeKey);
    return themeMode ?? 0;
  }

  void setThemeMode(int themeModeIndex) {
    ref.watch(sharedPrefsProvider).setInt(themeModeKey, themeModeIndex);
    state = themeModeIndex;
  }
}
