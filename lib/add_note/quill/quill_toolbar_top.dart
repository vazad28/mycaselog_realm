import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class QuillToolbarTop extends StatelessWidget {
  const QuillToolbarTop({required this.quillController, super.key});

  final QuillController quillController;

  @override
  Widget build(BuildContext context) {
    return QuillToolbar(
      child: Builder(builder: (context) {
        return Row(
          children: [
            QuillToolbarHistoryButton(
              isUndo: true,
              controller: quillController,
            ),
            QuillToolbarHistoryButton(
              isUndo: false,
              controller: quillController,
            ),
          ],
        );
      }),
    );
  }
}
