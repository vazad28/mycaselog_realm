import 'package:app_models/app_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

part 'cases_mixins.dart';

part '../../generated/cases/provider/cases_provider.freezed.dart';
part '../../generated/cases/provider/cases_provider.g.dart';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////

@riverpod
class CasesNotifier extends _$CasesNotifier with LoggerMixin {
  @override
  StateOf<CaseModel> build() {
    return const StateOf<CaseModel>.init();
  }

  /// Map events to state
  void on(CasesEvent event) {
    event.map(addCases: (value) => {});
  }
}
