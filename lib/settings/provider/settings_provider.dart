import 'package:app_models/app_models.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/app_providers.dart';
import '../../core/app_services.dart';

part '../../generated/settings/provider/settings_provider.g.dart';

/// Use a Notifier provider so we can have access to the settings without async
@Riverpod(keepAlive: true)
class SettingsNotifier extends _$SettingsNotifier with LoggerMixin {
  @override
  SettingsModel build() {
    final userID = ref.watch(authenticationUserProvider).id;

    final sub = ref
        .watch(dbProvider)
        .settingsCollection
        .getAll()
        .changes
        .listen((data) {
      /// Create unmanaged onject so that we can manipulate  it for crud
      if (data.results.isNotEmpty) state = data.results.last.toUnmanaged();
    });

    ref.onDispose(sub.cancel);

    return SettingsModelX.zero(userID);
  }

  /// Update settings
  void _updateSettings(SettingsModel settingsModel) {
    try {
      ref.watch(dbProvider).settingsCollection.add(
            state.userID,
            settingsModel..timestamp = ModelUtils.getTimestamp,
          );
    } catch (err) {
      ref.watch(dialogServiceProvider).showSnackBar(err.toString());
    }
  }

  /// Update settings public method
  void updateSettings(
    SettingsModel Function(SettingsModel) updateCallback,
  ) =>
      _updateSettings(updateCallback(state));
}

/// Template count provider
@riverpod
class TemplatesCount extends _$TemplatesCount {
  @override
  int build() {
    final sub = ref
        .watch(dbProvider)
        .templatesCollection
        .getAll()
        .changes
        .listen((items) => state = items.results.length);

    ref.onDispose(sub.cancel);
    return 0;
  }
}
