
part of 'medias_provider.dart';
/// ////////////////////////////////////////////////////////////////////
/// Event and Mixins
/// ////////////////////////////////////////////////////////////////////
@Freezed(
    copyWith: false,
    equal: false,
    when: FreezedWhenOptions.none,
    map: FreezedMapOptions(maybeMap: false, mapOrNull: false),)
class MediasEvent with _$MediasEvent {
  const factory MediasEvent.addMedias() = _AddMedias;
}

mixin MediasEventMixin {}

mixin MediasStateMixin {}