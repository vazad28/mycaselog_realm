import 'package:app_models/app_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

part 'settings_mixins.dart';

part '../../generated/settings/provider/settings_provider.freezed.dart';
part '../../generated/settings/provider/settings_provider.g.dart';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////
class SettingsModel {}

@riverpod
class SettingsNotifier extends _$SettingsNotifier with LoggerMixin {
  @override
  StateOf<SettingsModel> build() {
    return const StateOf<SettingsModel>.init();
  }

  /// Map events to state
  void on(SettingsEvent event) {
    event.map(addSettings: (value) => {});
  }
}
