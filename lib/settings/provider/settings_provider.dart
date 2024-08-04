import 'package:app_models/app_models.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';

part '../../generated/settings/provider/settings_provider.g.dart';

// final settingsProvider = StreamProvider<SettingsModel>((ref) {
//   final stream = ref.watch(dbProvider).settingsCollection.getSettingsChanges();
//   return stream.map((res) => res.object.toUnmanaged());
// });

/// Use a Notifier provider so we can have access to the settings without async
@Riverpod(keepAlive: true)
class SettingsNotifier extends _$SettingsNotifier with LoggerMixin {
  @override
  SettingsModel build() {
    //   //return ref.watch(settingsProvider).requireValue;
    //   final stream = ref.watch(dbProvider).settingsCollection.getSettingsChanges();
    // return stream.map((res) => res.object.toUnmanaged());
    return SettingsModelX.zero(ref.watch(userIDProvider));
  }

  Future<void> init() async {
    final settings = ref.watch(dbProvider).settingsCollection.getSettings();
    state = settings?.toUnmanaged() ??
        SettingsModelX.zero(ref.watch(userIDProvider));
  }

  /// Update settings
  void _updateSettings(SettingsModel settingsModel) {
    try {
      ref
          .watch(dbProvider)
          .settingsCollection
          .upsert(
            () => settingsModel..timestamp = ModelUtils.getTimestamp,
          )
          .then((res) {
        state = res.toUnmanaged();
      });
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
