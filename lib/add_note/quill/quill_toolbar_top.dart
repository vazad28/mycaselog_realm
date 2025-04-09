import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class QuillToolbarTop extends StatelessWidget {
  const QuillToolbarTop({required this.quillController, super.key});

  final QuillController quillController;

  @override
  Widget build(BuildContext context) {
    return QuillSimpleToolbar(
      controller: quillController,
      config: const QuillSimpleToolbarConfig(
        toolbarIconAlignment: WrapAlignment.start,
        multiRowsDisplay: false,
        buttonOptions: QuillSimpleToolbarButtonOptions(
          undoHistory: QuillToolbarHistoryButtonOptions(
            iconData: Icons.undo,
            tooltip: 'Undo',
          ),
          redoHistory: QuillToolbarHistoryButtonOptions(
            iconData: Icons.redo,
            tooltip: 'Redo',
          ),
        ),
      ),
    );
  }
}
