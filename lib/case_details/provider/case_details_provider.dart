import 'package:app_models/app_models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

part 'case_details_mixins.dart';

part '../../generated/case_details/provider/case_details_provider.freezed.dart';
part '../../generated/case_details/provider/case_details_provider.g.dart';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////

@riverpod
class CaseDetailsNotifier extends _$CaseDetailsNotifier with LoggerMixin{
  @override
   StateOf<CaseModel> build() {
    return const  StateOf<CaseModel>.init();
  }

  /// Map events to state
  void on(CaseDetailsEvent event)  {
    event.map(addCaseDetails: (value) => {});
  }

}
