import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../services/services.dart';
import 'providers.dart';

part '../../generated/core/providers/startup_providers.g.dart';

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

@Riverpod(keepAlive: true)
class ConnectivityStatus extends _$ConnectivityStatus {
  @override
  bool build() {
    final sub = Connectivity().onConnectivityChanged.listen((results) {
      final status = results.contains(ConnectivityResult.mobile) ||
          results.contains(ConnectivityResult.wifi);
      if (status == state) return;

      ref
          .watch(dialogServiceProvider)
          .showSnackBar(status ? 'Network connected' : 'No network connection');
    });

    ref.onDispose(() => sub.cancel);

    return true;
  }
}
