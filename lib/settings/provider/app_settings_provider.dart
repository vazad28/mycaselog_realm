import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';
import 'settings_event.dart';

part '../../generated/settings/provider/app_settings_provider.g.dart';

@riverpod
class AppSettings extends _$AppSettings with LoggerMixin {
  @override
  SettingsModel build() {
    final userID = ref.watch(userIDProvider);

    final sub = ref
        .watch(collectionsProvider)
        .settingsCollection
        .getSingle(userID)
        ?.changes
        .listen((data) {
      state = SettingsModelX.fromJson(data.object.toJson());
    });

    ref.onDispose(() => sub?.cancel());

    return SettingsModelX.zero(userID);
  }

  Future<void> _updateSettings(SettingsModel settingsModel) async {
    await ref.read(collectionsProvider).settingsCollection.add(
          ref.watch(userIDProvider),
          settingsModel,
        );
  }

  void on(SettingsEvent event) {
    event.map(
      updateThemeMode: (e) {
        final themeModeIndex = ThemeMode.values.indexOf(e.themeMode);
        _updateSettings(
          state..themeMode = themeModeIndex,
        );
        ref
            .read(currentThemeModeProvider.notifier)
            .setThemeMode(themeModeIndex);
      },
      updateThemeColor: (e) {
        _updateSettings(state..seedColorHex = e.seedColor);
      },
      updatesyncOnStart: (e) =>
          _updateSettings(state..syncOnStart = e.syncOnStart),
      updateLocalAuthEnabled: (e) =>
          _updateSettings(state..localAuthEnabled = e.localAuthEnabled),
      updateCaseTileNavigate: (e) => _updateSettings(
        state..caseTileNavigate = e.caseTileNavigateTo,
      ),
    );
  }
}

@riverpod
class TemplatesCount extends _$TemplatesCount {
  @override
  int build() {
    final sub = ref
        .watch(collectionsProvider)
        .templatesCollection
        .getAll()
        .changes
        .listen((items) => state = items.results.length);

    ref.onDispose(sub.cancel);
    return 0;
  }
}
