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
  final QuillEditorConfigurations configurations;
  final ScrollController scrollController;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return QuillEditor(
      controller: quillController,
      scrollController: scrollController,
      focusNode: focusNode,
      configurations: configurations.copyWith(
        keyboardAppearance: context.theme.brightness,
        elementOptions: const QuillEditorElementOptions(
          codeBlock: QuillEditorCodeBlockElementOptions(
            enableLineNumbers: true,
          ),
        ),
        customStyles: const DefaultStyles(
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
        scrollable: true,
        placeholder: 'Start writing your notes...',
        padding: const EdgeInsets.all(16),
        builder: (context, rawEditor) {
          return rawEditor;
        },
      ),
    );
  }
}
