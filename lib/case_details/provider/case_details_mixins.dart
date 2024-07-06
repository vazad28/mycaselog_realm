
part of 'case_details_provider.dart';
/// ////////////////////////////////////////////////////////////////////
/// Event and Mixins
/// ////////////////////////////////////////////////////////////////////
@Freezed(
    copyWith: false,
    equal: false,
    when: FreezedWhenOptions.none,
    map: FreezedMapOptions(maybeMap: false, mapOrNull: false),)
class CaseDetailsEvent with _$CaseDetailsEvent {
  const factory CaseDetailsEvent.addCaseDetails() = _AddCaseDetails;
}

mixin CaseDetailsEventMixin {}

mixin CaseDetailsStateMixin {}