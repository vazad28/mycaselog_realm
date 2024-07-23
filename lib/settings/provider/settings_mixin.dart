import 'package:app_models/app_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers/providers.dart';
import '../settings.dart';

mixin SettingsMixin {
  SettingsModel getSettings(WidgetRef ref) {
    return ref.read(settingsProvider);
  }

  Future<void> updateSettings(
    WidgetRef ref,
    SettingsModel settingsModel,
  ) {
    return ref
        .watch(collectionsProvider)
        .settingsCollection
        .add(settingsModel.userID, settingsModel);
  }
}
