
part of 'notes_provider.dart';
/// ////////////////////////////////////////////////////////////////////
/// Event and Mixins
/// ////////////////////////////////////////////////////////////////////
@Freezed(
    copyWith: false,
    equal: false,
    when: FreezedWhenOptions.none,
    map: FreezedMapOptions(maybeMap: false, mapOrNull: false),)
class NotesEvent with _$NotesEvent {
  const factory NotesEvent.addNotes() = _AddNotes;
}

mixin NotesEventMixin {}

mixin NotesStateMixin {}