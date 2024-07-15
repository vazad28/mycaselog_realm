import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'providers.dart';

part '../../generated/core/providers/startup_providers.g.dart';

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
