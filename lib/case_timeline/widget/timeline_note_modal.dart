import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misc_packages/misc_packages.dart';

import '../../core/providers/providers.dart';

class CaseTimelineNoteModal extends ConsumerStatefulWidget {
  const CaseTimelineNoteModal({required this.timelineNoteModel, super.key});

  final TimelineNoteModel timelineNoteModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CaseTimelineNoteModalState();
}

class _CaseTimelineNoteModalState extends ConsumerState<CaseTimelineNoteModal> {
  final TextEditingController _controller = TextEditingController();

  late TimelineNoteModel timelineNoteModel;

  @override
  void initState() {
    super.initState();
    timelineNoteModel = widget.timelineNoteModel.toUnmanaged();
  }

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
    if (_controller.text == timelineNoteModel.note) {
      return Navigator.of(context).pop();
    }

    ///else add to database
    try {
      ref.watch(dbProvider).timelineNotesCollection.addTimelineNote(
            timelineNoteModel..note = _controller.text.trim(),
          );
      Navigator.of(context).pop();
    } catch (err) {
      context.showSnackBar('Failed to save note');
    }
  }

  @override
  Widget build(BuildContext context) {
    _controller.text = timelineNoteModel.note ?? '';

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
