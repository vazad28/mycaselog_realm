
part of 'cases_provider.dart';
/// ////////////////////////////////////////////////////////////////////
/// Event and Mixins
/// ////////////////////////////////////////////////////////////////////
@Freezed(
    copyWith: false,
    equal: false,
    when: FreezedWhenOptions.none,
    map: FreezedMapOptions(maybeMap: false, mapOrNull: false),)
class CasesEvent with _$CasesEvent {
  const factory CasesEvent.addCases() = _AddCases;
}

mixin CasesEventMixin {}

mixin CasesStateMixin {}