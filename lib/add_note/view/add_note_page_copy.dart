// import 'dart:convert';

// import 'package:app_models/app_models.dart';
// import 'package:app_ui/app_ui.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_quill/flutter_quill.dart' as editor;
// import 'package:flutter_quill/flutter_quill.dart';
// import 'package:flutter_quill_to_pdf/flutter_quill_to_pdf.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:logger_client/logger_client.dart';
// import 'package:printing/printing.dart';

// import '../../core/core.dart';
// import '../../router/router.dart';
// import '../quill/my_quill_editor.dart';
// import '../widget/custom_appbar.dart';
// import '../widget/note_header.dart';
// import '../widget/quill_toolbar_bottom.dart';
// import 'fonts_loader.dart';

// part '../widget/note_app_bar.dart';

// final FontsLoader loader = FontsLoader();

// class AddNotePage extends ConsumerStatefulWidget {
//   const AddNotePage({
//     required this.noteID,
//     this.newRecord = false,
//     super.key,
//   });

//   final String noteID;
//   final bool newRecord;

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _AddNotePageState();
// }

// class _AddNotePageState extends ConsumerState<AddNotePage> {
//   final editor.QuillController _controller = editor.QuillController.basic();
//   final TextEditingController _titleController = TextEditingController();
//   ValueNotifier<String> selected = ValueNotifier('All');

//   @override
//   void dispose() {
//     _controller.dispose();
//     _titleController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: CustomScrollView(
//         physics: const NeverScrollableScrollPhysics(),
//         slivers: [
//           SliverFillRemaining(
//               child: Column(
//             children: [
//               CustomAppBar(onPressed: () async {
//                 final json =
//                     jsonEncode(_controller.document.toDelta().toJson());
//                 final plainText =
//                     jsonEncode(_controller.document.toPlainText());
//                 // await FirestoreService()
//                 //     .addDocument(
//                 //         document: json,
//                 //         searchableDocument: plainText,
//                 //         title: _titleController.text,
//                 //         folder: selected.value,
//                 //         date: DateTime.now())
//                 //     .then((value) {
//                 //   if (value != null) {
//                 //     CustomSnackBar.show(
//                 //         context, '$value', Duration(seconds: 2));
//                 //   }
//                 //   Navigator.pop(context);
//                 // });
//               }),
//               NoteHeader(
//                 editNoteMod: false,
//                 titleController: _titleController,
//                 selected: selected,
//               ),
//               Expanded(
//                 child: editor.QuillEditor(
//                   focusNode: FocusNode(),
//                   scrollController: ScrollController(),
//                   controller: _controller,
//                 ),
//               ),
//               editor.QuillToolbar(
//                 controller: _controller,
//                 multiRowsDisplay: false,
//                 showIndent: true,
//                 showImageButton: false,
//                 dialogTheme: editor.QuillDialogTheme(
//                     inputTextStyle: TextStyle(color: Colors.white),
//                     labelTextStyle: TextStyle(color: Colors.white)),
//                 showLink: true,
//                 showDirection: false,
//                 showBackgroundColorButton: false,
//                 showRedo: true,
//                 showSearchButton: true,
//                 showFontSize: false,
//                 showAlignmentButtons: true,
//                 showCodeBlock: true,
//                 showFontFamily: false,
//                 showInlineCode: false,
//                 showVideoButton: false,
//               )
//             ],
//           ))
//         ],
//       ),
//     ));
//   }
// }
