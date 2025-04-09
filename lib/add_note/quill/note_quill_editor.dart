import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class NoteQuillEditor extends StatelessWidget {
  const NoteQuillEditor({
    required this.configurations,
    required this.scrollController,
    required this.focusNode,
    required this.quillController,
    super.key,
  });

  final QuillController quillController;
  final QuillEditorConfig configurations; // Use the new class name
  final ScrollController scrollController;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return QuillEditor(
      // Use QuillEditor.basic or QuillEditor
      controller: quillController,
      scrollController: scrollController,
      focusNode: focusNode,
      config: configurations.copyWith(
        keyboardAppearance: context.theme.brightness,
        expands:
            false, // Set to true if you want the editor to expand vertically
        padding: const EdgeInsets.all(8),
        customStyles: const DefaultStyles(
          // customStyles is now a top-level property
          h1: DefaultTextBlockStyle(
            TextStyle(
              fontSize: 32,
              height: 1.15,
              fontWeight: FontWeight.w300,
            ),
            HorizontalSpacing(16, 0),
            VerticalSpacing.zero,
            VerticalSpacing.zero,
            null,
          ),
          sizeSmall: TextStyle(fontSize: 10),
          subscript: TextStyle(
            fontFamily: 'SF-UI-Display',
            fontFeatures: [FontFeature.subscripts()],
          ),
          superscript: TextStyle(
            fontFamily: 'SF-UI-Display',
            fontFeatures: [FontFeature.superscripts()],
          ),
        ),
        placeholder: 'Start writing your notes...',
      ),
    );
  }
}

// class NoteQuillEditor extends StatelessWidget {
//   const NoteQuillEditor({
//     required this.configurations,
//     required this.scrollController,
//     required this.focusNode,
//     required this.quillController,
//     super.key,
//   });

//   final QuillController quillController;
//   final QuillEditorConfig configurations;
//   final ScrollController scrollController;
//   final FocusNode focusNode;

//   @override
//   Widget build(BuildContext context) {
//     return QuillEditor(
//       controller: quillController,
//       scrollController: scrollController,
//       focusNode: focusNode,
//       config: configurations.copyWith(
//         keyboardAppearance: context.theme.brightness,
//         expands:
//             false, // Set to true if you want the editor to expand vertically
//         padding: const EdgeInsets.all(8),
//         customStyles: const DefaultStyles(
//           h1: DefaultTextBlockStyle(
//             TextStyle(
//               fontSize: 32,
//               height: 1.15,
//               fontWeight: FontWeight.w300,
//             ),
//             HorizontalSpacing(16, 0),
//             VerticalSpacing.zero,
//             VerticalSpacing.zero,
//             null,
//           ),
//           sizeSmall: TextStyle(fontSize: 10),
//           subscript: TextStyle(
//             fontFamily: 'SF-UI-Display',
//             fontFeatures: [FontFeature.subscripts()],
//           ),
//           superscript: TextStyle(
//             fontFamily: 'SF-UI-Display',
//             fontFeatures: [FontFeature.superscripts()],
//           ),
//         ),
//         scrollable: true,
//         placeholder: 'Start writing your notes...',
//         builder: (context, rawEditor) {
//           return rawEditor;
//         },
//       ),
//     );
//   }
// }
