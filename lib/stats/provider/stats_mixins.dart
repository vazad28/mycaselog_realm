
part of 'stats_provider.dart';
/// ////////////////////////////////////////////////////////////////////
/// Event and Mixins
/// ////////////////////////////////////////////////////////////////////
@Freezed(
    copyWith: false,
    equal: false,
    when: FreezedWhenOptions.none,
    map: FreezedMapOptions(maybeMap: false, mapOrNull: false),)
class StatsEvent with _$StatsEvent {
  const factory StatsEvent.addStats() = _AddStats;
}

mixin StatsEventMixin {}

mixin StatsStateMixin {}