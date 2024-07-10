// import 'package:app_models/app_models.dart';
// import 'package:app_package/app_package.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_quill/flutter_quill.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:reactive_forms/reactive_forms.dart';

// import '../add_note.dart';
// import '../quill/my_quill_editor.dart';

// class AddNoteForm extends ConsumerStatefulWidget {
//   const AddNoteForm({
//     required this.controller,
//     required this.focusNode,
//     // required this.quillEditor,
//     required this.noteModel,
//     super.key,
//   });

//   final QuillController controller;
//   final FocusNode focusNode;
//   //final MyQuillEditor quillEditor;
//   final NoteModel noteModel;

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _AddNoteFormState();
// }

// class _AddNoteFormState extends ConsumerState<AddNoteForm>
//     with AddNoteStateMixin {
//   /// controllers
//   final _editorScrollController = ScrollController();

//   /// focus nodes
//   final _titleFocusNode = FocusNode();

//   /// instance vars
//   final _isReadOnly = false;

//   @override
//   void dispose() {
//     _titleFocusNode.dispose();
//     _editorScrollController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ReactiveForm(
//       key: const Key('__add_note_form_key__'),
//       formGroup: FormGroup({
//         NoteModelProps.title.name: FormControl<String>(
//           value: widget.noteModel.title,
//         ),
//         NoteModelProps.note.name: FormControl<String>(
//           value: widget.noteModel.note,
//         ),
//       }),
//       // getNoteFieldFormGroup(ref),
//       child: Column(
//         children: [
//           /// note title
//           ReactiveTextField<String>(
//             formControlName: NoteModelProps.title.name,
//             maxLines: null,
//             maxLength: 60,
//             maxLengthEnforcement: MaxLengthEnforcement.enforced,
//             style: context.textTheme.titleLarge?.copyWith(
//               color: context.colorScheme.onSurfaceVariant,
//             ),
//             onSubmitted: (control) => control.value?.trim(),
//             textCapitalization: TextCapitalization.words,
//             keyboardType: TextInputType.text,
//             decoration: const InputDecoration(
//               border: InputBorder.none,
//               enabledBorder: InputBorder.none,
//               hintText: 'title of your note',
//               floatingLabelBehavior: FloatingLabelBehavior.auto,
//             ),
//             onTapOutside: (_) => primaryFocus?.unfocus(),
//           ).formFieldPadding(),

//           const Divider(),

//           SizedBox.shrink(
//             child: ReactiveTextField<String>(
//               formControlName: NoteModelProps.note.name,
//               maxLines: 1,
//               onSubmitted: (control) => widget.controller.document.toJsonString,
//             ),
//           ),

//           /// note description
//           Expanded(
//             child: MyQuillEditor(
//               configurations: QuillEditorConfigurations(
//                 sharedConfigurations: _sharedConfigurations,
//                 controller: widget.controller,
//                 readOnly: _isReadOnly,
//                 placeholder: 'your note..',
//               ),
//               scrollController: _editorScrollController,
//               focusNode: widget.focusNode,
//             ),
//           ),

//           /// Spacer
//           VerticalSpacer.normal,
//         ],
//       ),
//     );
//   }

//   QuillSharedConfigurations get _sharedConfigurations {
//     return const QuillSharedConfigurations();
//   }
// }
