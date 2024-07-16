import 'package:app_annotations/app_annotations.dart';
import 'package:app_extensions/app_extensions.dart';
import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/mixins/mixins.dart';
import '../../core/services/dialog_service.dart';
import '../case_timeline.dart';

class TimelineChatInput extends ConsumerStatefulWidget {
  const TimelineChatInput({
    required this.caseModel,
    super.key,
  });

  final CaseModel caseModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TimelineChatInputState();
}

class _TimelineChatInputState extends ConsumerState<TimelineChatInput>
    with TimelineMixin {
  String get todaysDate => DateTime.now().formatYMD();

  /// Widget builder method
  @override
  Widget build(BuildContext context) {
    final Widget cameraButton = IconButton(
      icon: const Icon(
        Icons.camera_alt,
      ),
      onPressed: () => _openAddMedia(MediaType.image, ImageSource.camera),
    );

    final Widget galleryButton = IconButton(
      icon: const Icon(
        Icons.photo_library,
      ),
      onPressed: () => _openAddMedia(MediaType.image, ImageSource.gallery),
    );

    return AppBar(
      primary: false,
      leading: IconButton(
        icon: const Icon(Icons.calendar_month),
        onPressed: _createTimelineItem,
      ),
      title: GestureDetector(
        onTap: _openAddNote,
        child: Text(
          'add note..',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      actions: [cameraButton, galleryButton],
      elevation: 2,
    );
  }

  /// controller methods
  void _openAddNote() {
    addTimelineNote(
      ref,
      caseID: widget.caseModel.caseID,
      timestamp: ModelUtils.getTimestamp,
    );
  }

  Future<void> _createTimelineItem() async {
    final dateTimePicked = await ref.read(dialogServiceProvider).openDatePicker(
          initialDate: DateTime.now(),
        );
    if (dateTimePicked == null) return;
    final notifier = ref.watch(caseTimelineNotifierProvider.notifier);
    //ignore: cascade_invocations
    notifier.createTempTimelineItem(widget.caseModel, dateTimePicked);
  }

  void _openAddMedia(MediaType image, ImageSource source) {
    addTimelinePhoto(
      ref,
      caseID: widget.caseModel.caseID,
      source: source,
      timestamp: ModelUtils.getTimestamp,
    );
  }
}
