// import 'package:app_models/app_models.dart';
// import 'package:app_package/app_package.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_quill/flutter_quill.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:logger_client/logger_client.dart';
// import 'package:reactive_forms/reactive_forms.dart';
// import 'package:recase/recase.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:state_of/state_of.dart';

// import '../../app/providers/repository_providers.dart';
// import '../../router/provider/bottom_bar_visibility_provider.dart';
// import '../../router/provider/router_observers.dart';

// part '../../generated/add_note/provider/add_note_provider.freezed.dart';
// part '../../generated/add_note/provider/add_note_provider.g.dart';

// @Freezed(
//   copyWith: false,
//   equal: false,
//   when: FreezedWhenOptions.none,
//   map: FreezedMapOptions(maybeMap: false, mapOrNull: false),
// )
// class AddNoteEvent with _$AddNoteEvent {
//   const factory AddNoteEvent.onSubmit() = _AddAddSubmit;
// }

// /// ////////////////////////////////////////////////////////////////////
// /// Mixins
// /// ////////////////////////////////////////////////////////////////////
// mixin AddNoteEventMixin {
//   void submit(WidgetRef ref) => ref
//       .watch(addNoteNotifierProvider.notifier)
//       .on(const AddNoteEvent.onSubmit());
// }

// mixin AddNoteStateMixin {
//   FormGroup getNoteFieldFormGroup(WidgetRef ref) =>
//       ref.watch(noteFormGroupProvider);

//   void seedFormProvider(
//     WidgetRef ref,
//     NoteModel noteModel,
//   ) =>
//       ref.watch(addNoteSeederProvider.notifier).seed(noteModel);

//   bool isFormSeeded(WidgetRef ref) => ref.watch(addNoteSeederProvider) != null;

//   StateOf<NoteModel> formSubmitStatus(
//     WidgetRef ref,
//   ) =>
//       ref.watch(addNoteNotifierProvider);

//   bool canPop(WidgetRef ref) =>
//       ref.watch(addNoteNotifierProvider.notifier).canPop();

//   void switchNavBarVisibility(WidgetRef ref, {required bool visibility}) =>
//       ref.watch(bottomNavVisibilityProvider.notifier).update(value: visibility);

//   RouteObserver<ModalRoute<void>> pageRouteObserver(WidgetRef ref) =>
//       ref.read(shellRoutesObserversProvider).notesRouteObserver;
// }

// @riverpod
// class AddNoteSeeder extends _$AddNoteSeeder {
//   @override
//   NoteModel? build() => null;

//   late final Map<String, dynamic> originalModelJson;

//   /// called by view with passed param caseID to load case model
//   Future<void> seed(NoteModel noteModel) async {
//     state = noteModel;
//     originalModelJson = noteModel.toJson();
//   }
// }

// @riverpod
// FormGroup noteFormGroup(NoteFormGroupRef ref) {
//   final noteModel = ref.watch(addNoteSeederProvider);

//   if (noteModel == null) return FormGroup({});

//   final controls = <String, AbstractControl<Object?>>{
//     NoteModelProps.title.name: FormControl<String>(
//       value: noteModel.title?.titleCase,
//     ),
//     // NoteModelProps.note.name: FormControl<String>(
//     //   value: noteModel.note,
//     // ),
//   };

//   return FormGroup(controls);
// }

// /// ////////////////////////////////////////////////////////////////////
// /// Main Provider
// /// ////////////////////////////////////////////////////////////////////

// @riverpod
// class AddNoteNotifier extends _$AddNoteNotifier with LoggerMixin {
//   /// if form was attempted to be saved before or no
//   bool _formSubmitAttempted = false;
//   bool get formSubmitAttempted => _formSubmitAttempted;

//   /// get the original caseModel
//   NoteModel? get originalModel => ref.read(addNoteSeederProvider);

//   //final NoteModel _originalModel;
//   Map<String, dynamic> get _originalModelJson =>
//       ref.read(addNoteSeederProvider.notifier).originalModelJson;

//   /// Form Group instance
//   FormGroup get _formGroup => ref.watch(noteFormGroupProvider);

//   Document quillDocument = Document();

//   /// Provider build method
//   @override
//   StateOf<NoteModel> build() {
//     final noteModel = ref.watch(addNoteSeederProvider);

//     return noteModel == null
//         ? const StateOf<NoteModel>.init()
//         : const StateOf<NoteModel>.initialized();
//   }

//   /// Event  mapper
//   void on(AddNoteEvent e) {
//     e.map(
//       onSubmit: (value) {
//         _formSubmitAttempted = true;
//         _onSubmit();
//       },
//     );
//   }

//   /// Method to submit the form
//   void _onSubmit() {
//     try {
//       _formSubmitAttempted = true;
//       state = const StateOf<NoteModel>.loading();

//       /// validate forms and proceed only if forms are valid
//       if (!_validateForms()) return;

//       /// everything checks out
//       final modelToSubmit = _createModelToSave();

//       if (modelToSubmit == null) {
//         state = const StateOf<NoteModel>.failure(AppFailure.missingData());
//         return;
//       }

//       _doSubmit(modelToSubmit);
//     } catch (err) {
//       state = StateOf<NoteModel>.failure(err.toAppFailure());
//     }
//   }

//   /// Validate the form data
//   bool _validateForms() {
//     if (_formGroup.invalid) {
//       _formGroup.markAllAsTouched();
//       return false;
//     }
//     return true;
//   }

//   /// Update our model from formdata
//   NoteModel? _createModelToSave() {
//     /// update with basic data
//     final modelJson = {..._originalModelJson, ..._formGroup.value};

//     return NoteModel.fromJson(modelJson)
//         .copyWith(note: quillDocument.toJsonString);
//   }

//   /// ---- DO the form submit  ---
//   Future<void> _doSubmit(NoteModel modelToSubmit) async {
//     final result =
//         await ref.read(notesRepositoryProvider).addNote(modelToSubmit);

//     result.when(
//       success: (res) {
//         /// refresh notes
//         ///ref.watch(notesNotifierProvider.notifier).refreshNotes();
//         state = StateOf<NoteModel>.success(res);
//       },
//       failure: (failure) {
//         logger.severe(failure);
//         state = StateOf<NoteModel>.failure(failure);
//       },
//     );
//   }

//   /// ----- can pop -----
//   bool canPop() {
//     if (_formSubmitAttempted) return true;

//     /// Create model instance with form data
//     final formToModel = _createModelToSave();
//     //print('${formToModel?.toJson()} ${originalModel?.toJson()}');

//     /// check equality using props defined in Model using equatable
//     final modelsAreEqual = formToModel == originalModel;

//     return modelsAreEqual &&
//         formToModel?.quillDocument.toPlainText() ==
//             originalModel?.quillDocument.toPlainText();
//     // && quillJson == originalModel?.note;
//   }
// }
