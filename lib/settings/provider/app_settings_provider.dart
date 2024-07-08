import 'package:app_data/app_data.dart';
import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:logger_client/logger_client.dart';
import 'package:realm/realm.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/providers/providers.dart';
import 'settings_event.dart';

part '../../generated/settings/provider/app_settings_provider.g.dart';

@riverpod
class CurrentThemeMode extends _$CurrentThemeMode {
  @override
  int build() {
    final themeMode =
        ref.watch(appSettingsProvider.select((value) => value.themeMode));
    return themeMode;
  }

  void setThemeMode(int themeModeIndex) => state = themeModeIndex;
}

@Riverpod(keepAlive: true)
class AppSettings extends _$AppSettings with LoggerMixin {
  @override
  SettingsModel build() {
    _settingsRepository = ref.read(settingsRepositoryProvider);

    return _settingsRepository.getAppSettings();
  }

  late final SettingsRepository _settingsRepository;

  Future<void> _updateSettings(SettingsModel settingsModel) async {
    await _settingsRepository.setAppSettings(settingsModel);
    state = settingsModel;
  }

  void on(SettingsEvent event) {
    event.map(
      updateThemeMode: (e) {
        final themeModeIndex = ThemeMode.values.indexOf(e.themeMode);
        _updateSettings(
          state.copyWith(
            themeMode: themeModeIndex,
          ),
        );
        ref
            .read(currentThemeModeProvider.notifier)
            .setThemeMode(themeModeIndex);
      },
      updateThemeColor: (e) {
        _updateSettings(state.copyWith(seedColorHex: e.seedColor));
        // ref.read(currentThemeModeProvider.notifier).setThemeColor(e.seedColor);
      },
      updatesyncOnStart: (e) =>
          _updateSettings(state.copyWith(syncOnStart: e.syncOnStart)),
      updateLocalAuthEnabled: (e) =>
          _updateSettings(state.copyWith(localAuthEnabled: e.localAuthEnabled)),
      updateCaseTileNavigate: (e) => _updateSettings(
        state.copyWith(caseTileNavigate: e.caseTileNavigateTo),
      ),
    );
  }

  void load() {}
}

@Riverpod(keepAlive: true)
class TemplatesCount extends _$TemplatesCount {
  @override
  int build() {
    final sub = ref
        .read(templatesRepositoryProvider)
        .getTotalTemplatesCount()
        .listen(loadCount);

    ref.onDispose(sub.cancel);
    return 0;
  }

  void loadCount(RealmResultsChanges<TemplateModel> event) {
    state = event.results.length;
  }
}
