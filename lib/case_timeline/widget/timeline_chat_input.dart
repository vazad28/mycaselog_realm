import 'package:app_annotations/app_annotations.dart';
import 'package:app_extensions/app_extensions.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:media_manager/media_manager.dart';
import 'package:misc_packages/misc_packages.dart';

import '../../core/providers/providers.dart';
import '../../media_uploader/provider/media_uploader_provider.dart';
import '../case_timeline.dart';

/// TimelineChatInput ROOT Widget
class TimelineChatInput extends ConsumerStatefulWidget {
  const TimelineChatInput({
    required this.caseModel,
    super.key,
  });

  final CaseModel caseModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TimelineChatInputController();
}

/// TimelineChatInput CONTROLLER Widget
class _TimelineChatInputController extends ConsumerState<TimelineChatInput> {
  @override
  void initState() {
    super.initState();
  }

  String get todaysDate => DateTime.now().formatYMD();

  /// Widget builder method
  @override
  Widget build(BuildContext context) => _TimelineChatInputView(this);

  /// controller methods
  Future<void> _openAddNote() async {
    await context
        .openOverlay<TimelineNoteModel?>(CaseTimelineNoteModal(
      timelineNoteModel: TimelineNoteModelX.zero(
        caseID: widget.caseModel.caseID,
        authorID: ref.read(authenticationUserProvider).id,
      ),
    ))
        .then((note) {
      if (note == null) return;

      /// add to database
      ref.watch(dbProvider).casesCollection.putNote(note);
    });
  }

  void _openMediaSource(MediaType mediaType, ImageSource source) {
    MediaManager.imagePickerService
        .pickImage(
      source: source,
    )
        .then((imageXFile) {
      ref.read(mediaUploader).uploadImage(
            imageFile: imageXFile,
            caseID: widget.caseModel.caseID,
          );
    }).catchError((err) {
      if (!context.mounted) return;
      context.showSnackBar('Failed to add image');
    });
    // ref.watch(mediaPickerProvider.notifier).pickImage(
    //       caseID: widget.caseModel.caseID,
    //       eventTimestamp: ModelUtils.getTimestamp,
    //       imageSource: ImageSource.gallery,
    //     );
  }

  void createTimelineItem() {
    context.showInfoDialog('Not implemented yet');
    //final notifier = ref.watch(caseTimelineNotifierProvider.notifier);
    // ignore: cascade_invocations
    //notifier.on(CaseTimelineEvent.onCreateTimelineItem(widget.caseModel));
  }
}

/// TimelineChatInput VIEW Widget
class _TimelineChatInputView
    extends WidgetView<TimelineChatInput, _TimelineChatInputController> {
  const _TimelineChatInputView(super.state);

  @override
  Widget build(BuildContext context) {
    final Widget cameraButton = IconButton(
      icon: const Icon(
        Icons.camera_alt,
      ),
      onPressed: () =>
          state._openMediaSource(MediaType.image, ImageSource.camera),
    );

    final Widget galleryButton = IconButton(
      icon: const Icon(
        Icons.photo_library,
      ),
      onPressed: () =>
          state._openMediaSource(MediaType.image, ImageSource.gallery),
    );

    return AppBar(
      primary: false,
      leading: IconButton(
        icon: const Icon(Icons.calendar_month),
        onPressed: state.createTimelineItem,
      ),
      title: GestureDetector(
        onTap: state._openAddNote,
        child: Text(
          'add note..',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      actions: [cameraButton, galleryButton],
      elevation: 2,
    );

    //return SizedBox();
  }
}
