import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class CaseTimelineNoteModal extends StatefulWidget {
  const CaseTimelineNoteModal({required this.timelineNoteModel, super.key});

  final TimelineNoteModel timelineNoteModel;

  @override
  State<CaseTimelineNoteModal> createState() => _TimelineNoteModalState();
}

class _TimelineNoteModalState extends State<CaseTimelineNoteModal> {
  final TextEditingController _controller = TextEditingController();

  Widget get timelineNote => Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: TextField(
          maxLines: null,
          minLines: 3,
          autofocus: true,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: 'note..',
          ),
          controller: _controller,
        ),
      );

//save or delete note
  void _saveNote() {
    /// if note is empty and timelinenote model also was empty return
    if (_controller.text == widget.timelineNoteModel.note) {
      return Navigator.of(context).pop();
    }

    ///else save it
    Navigator.of(context).pop(
      widget.timelineNoteModel..note = _controller.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    _controller.text = widget.timelineNoteModel.note ?? '';

    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(ThemeConstants.submitIcon),
            onPressed: _saveNote,
          ),
        ],
        title: const Text('Note'),
      ),
      body: timelineNote,
    );
  }
}
