part of './case_timeline_provider.dart';

/// Timeline actions ENUM
enum TimelineActionEnum {
  addCameraPhoto,
  addCameraVideo,
  addGalleryPhoto,
  addGalleryVideo,
  addMedia,
  addNote,
  changeAllMediaDate,
  changeMediaDate,
  changeNoteDate,
  changeTimelineDate,
  deleteMedia,
  deleteNote,
  shareMedia,
}

/// model class
class TimelineHeaderAction {
  TimelineHeaderAction(this.action, this.icon);

  final TimelineActionEnum action;
  final IconData icon;
}

/// App action for timelines
class TimelineAction extends BaseAppAction {
  // ignore: use_super_parameters
  TimelineAction({
    required TimelineActionEnum action,
    String? title,
    super.isActive,
    super.leading,
    super.subTitle,
    super.trailing,
  }) : super(action: action, title: title ?? action.name);
}

final timelineItemActions = [
  TimelineAction(
    action: TimelineActionEnum.addCameraPhoto,
    title: TimelineActionEnum.addCameraPhoto.name,
    leading: const Icon(Icons.camera_alt),
  ),
  TimelineAction(
    action: TimelineActionEnum.addGalleryPhoto,
    title: TimelineActionEnum.addGalleryPhoto.name,
    leading: const Icon(Icons.photo_library),
  ),
  TimelineAction(
    action: TimelineActionEnum.addNote,
    title: TimelineActionEnum.addNote.name,
    leading: const Icon(Icons.mode_edit),
  ),
  TimelineAction(
    action: TimelineActionEnum.changeTimelineDate,
    title: TimelineActionEnum.changeTimelineDate.name,
    leading: const Icon(Icons.calendar_today),
  ),
  TimelineAction(
    action: TimelineActionEnum.shareMedia,
    title: TimelineActionEnum.shareMedia.name,
    leading: const Icon(Icons.share),
  ),
];

final mediaActionsLong = [
  TimelineAction(
    action: TimelineActionEnum.changeMediaDate,
    title: TimelineActionEnum.changeMediaDate.name,
    leading: const Icon(Icons.camera_alt),
  ),
  TimelineAction(
    action: TimelineActionEnum.deleteMedia,
    title: TimelineActionEnum.deleteMedia.name,
    leading: const Icon(Icons.delete),
  ),
  TimelineAction(
    action: TimelineActionEnum.shareMedia,
    title: TimelineActionEnum.shareMedia.name,
    leading: const Icon(Icons.share),
  ),
];

final mediaActionsShort = [
  TimelineAction(
    action: TimelineActionEnum.deleteMedia,
    title: TimelineActionEnum.deleteMedia.name,
    leading: const Icon(Icons.delete),
  ),
  TimelineAction(
    action: TimelineActionEnum.shareMedia,
    title: TimelineActionEnum.shareMedia.name,
    leading: const Icon(Icons.share),
  ),
];

final timelineNoteActions = [
  TimelineAction(
    action: TimelineActionEnum.changeNoteDate,
    title: TimelineActionEnum.changeNoteDate.name,
    leading: const Icon(Icons.camera_alt),
  ),
  TimelineAction(
    action: TimelineActionEnum.deleteNote,
    title: TimelineActionEnum.deleteNote.name,
    leading: const Icon(Icons.delete),
  ),
];
