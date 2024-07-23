import 'package:app_models/app_models.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';

part '../../generated/settings/provider/settings_provider.g.dart';

// @riverpod
// Stream<RealmObjectChanges<SettingsModel>> settings(SettingsRef ref) {
//   return ref
//       .watch(collectionsProvider)
//       .settingsCollection
//       .getSettings()
//       .changes;
// }

@riverpod
class Settings extends _$Settings with LoggerMixin {
  @override
  SettingsModel build() {
    final userID = ref.watch(authenticationUserProvider).id;
    final sub = ref
        .watch(collectionsProvider)
        .settingsCollection
        .getSingle(userID)
        ?.changes
        .listen((data) {
      state = data.object;
    });

    ref.onDispose(() => sub?.cancel());
    return SettingsModelX.zero(userID);
  }
}

//   Future<void> _updateSettings(SettingsModel settingsModel) async {
//     await ref
//         .read(collectionsProvider)
//         .settingsCollection
//         .saveSettings(settingsModel);
//     //.add(ref.watch(authenticationUserProvider).id, settingsModel);
//   }

//   void on(SettingsEvent event) {
//     event.map(
//       updateThemeMode: (e) {
//         final themeModeIndex = ThemeMode.values.indexOf(e.themeMode);
//         _updateSettings(
//           state..themeMode = themeModeIndex,
//         );
//         ref
//             .read(currentThemeModeProvider.notifier)
//             .setThemeMode(themeModeIndex);
//       },
//       updateThemeColor: (e) {
//         _updateSettings(state..seedColorHex = e.seedColor);
//       },
//       updatesyncOnStart: (e) {
//         _updateSettings(state..syncOnStart = e.syncOnStart);
//         LiveSync().updateStatus(status: false);
//       },
//       updateLocalAuthEnabled: (e) =>
//           _updateSettings(state..localAuthEnabled = e.localAuthEnabled),
//       updateCaseTileNavigate: (e) => _updateSettings(
//         state..caseTileNavigate = e.caseTileNavigateTo,
//       ),
//     );
//   }
// }

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
