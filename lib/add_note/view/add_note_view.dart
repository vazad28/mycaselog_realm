// import 'package:app_models/app_models.dart';
// import 'package:app_ui/app_ui.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_quill/flutter_quill.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:logger_client/logger_client.dart';

// import '../../core/providers/providers.dart';
// import '../../core/widgets/widgets.dart';
// import '../quill/note_quill_editor.dart';
// import '../quill/quill_toolbar_top.dart';

// class AddNoteView extends ConsumerStatefulWidget {
//   final QuillController _controller;
//   final ScrollController _editorScrollController;
//   final FocusNode _editorFocusNode;
//   final NoteModel _noteModel;

//   const AddNoteView(
//       {required QuillController controller,
//       required ScrollController scrollController,
//       required FocusNode editorFocusNode,
//       required NoteModel noteModel,
//       super.key})
//       : _controller = controller,
//         _editorScrollController = scrollController,
//         _editorFocusNode = editorFocusNode,
//         _noteModel = noteModel;

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _AddNoteViewState();
// }

// class _AddNoteViewState extends ConsumerState<AddNoteView> with LoggerMixin {
//   final _titleFieldController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // QuillToolbarTop(
//         //   key: const Key('__add_note_quill_editor_top bar_key__'),
//         //   quillController: widget._controller,
//         // ),
//         TextFormField(
//           controller: _titleFieldController,
//           maxLines: null,
//           style: context.textTheme.titleLarge?.copyWith(
//             color: context.colorScheme.onSurfaceVariant,
//           ),
//           textCapitalization: TextCapitalization.words,
//           keyboardType: TextInputType.text,
//           decoration: const InputDecoration(
//             border: InputBorder.none,
//             enabledBorder: InputBorder.none,
//             hintText: 'Title of your note',
//             floatingLabelBehavior: FloatingLabelBehavior.auto,
//           ),
//           onTapOutside: (_) => primaryFocus?.unfocus(),
//         ),
//         Builder(
//           builder: (context) {
//             return Expanded(
//               child: NoteQuillEditor(
//                 quillController: widget._controller,
//                 configurations: const QuillEditorConfigurations(),
//                 scrollController: widget._editorScrollController,
//                 focusNode: widget._editorFocusNode,
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }

//   // /// ---- DO the form submit  ---
//   Future<void> _doSubmit() async {
//     try {
//       final authorID = ref.read(authenticationUserProvider).id;

//       final noteModelUnmanaged = NoteModelX.fromJson(widget._noteModel.toJson())
//         ..authorID = authorID
//         ..title = _titleFieldController.text
//         ..note = widget._controller.document.toJsonString;

//       await ref
//           .watch(dbProvider)
//           .notesCollection
//           .upsert(() => noteModelUnmanaged);

//       await Future<void>.delayed(Durations.medium4);

//       if (!context.mounted) return;
//       // ignore: use_build_context_synchronously
//       Navigator.pop(context);
//     } catch (err) {
//       logger.severe(err);
//     }
//   }
// }
