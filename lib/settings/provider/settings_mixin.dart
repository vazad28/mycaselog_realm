// part of 'settings_provider.dart';

// mixin SettingsMixin {
//   /// Update settings
//   void updateSettings(
//     WidgetRef ref,
//     SettingsModel Function(SettingsModel) updateCallback,
//   ) {
//     try {
//       final currentSettings = ref.watch(settingsProvider).requireValue;
//       ref.watch(dbProvider).settingsCollection.upsert(
//             () => updateCallback(currentSettings)
//               ..timestamp = ModelUtils.getTimestamp,
//           );
//     } catch (err) {
//       ref.watch(dialogServiceProvider).showSnackBar(err.toString());
//     }
//   }
// }
