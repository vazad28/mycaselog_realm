part of '../case_timeline_item_view.dart';

class CaseTimelineItemMedia extends ConsumerStatefulWidget {
  const CaseTimelineItemMedia({
    required this.timelineItemModel,
    super.key,
  });

  final TimelineItemModel timelineItemModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CaseTimelineItemMediaState();
}

class _CaseTimelineItemMediaState extends ConsumerState<CaseTimelineItemMedia> {
  @override
  Widget build(BuildContext context) {
    final mediaModels = widget.timelineItemModel.mediaList;

    if (mediaModels.isEmpty) return const SizedBox.shrink();

    final crossAxisCount = MediaQuery.of(context).size.width ~/ 120;
    final width = (MediaQuery.of(context).size.width / 3).ceil().toDouble();

    return Material(
      color: context.colorScheme.surface,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          padding: EdgeInsets.zero,
          primary: false,
          shrinkWrap: true,
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: _buildEventMedia(context, mediaModels, width),
        ),
      ),
    );
  }

  List<Widget> _buildEventMedia(
    BuildContext context,
    List<MediaModel> mediaModels,
    double width,
  ) {
    return mediaModels
        .mapIndexed(
          (index, mediaModel) => _CaseTimelineItemMedia(
            mediaModels: mediaModels,
            index: index,
            width: width,
          ),
        )
        .toList();
  }
}

class _CaseTimelineItemMedia extends StatelessWidget {
  const _CaseTimelineItemMedia({
    required this.mediaModels,
    required this.index,
    required this.width,
  });

  final List<MediaModel> mediaModels;
  final int index;
  final double width;

  @override
  Widget build(BuildContext context) {
    final mediaModel = mediaModels[index];

    return OpenContainer<List<MediaModel>?>(
      closedElevation: 0,
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      tappable: false,
      closedBuilder: (_, action) {
        return Thumbnail(
          mediaModel: mediaModel,
        );
        // .simple(
        //   mediaModel: mediaModel,
        //   width: width,
        //   onTap: action,
        //   onLongPress: onLongPress,
        // );
      },
      openBuilder: (_, action) => const Placeholder(),
      // MediaGalleryPage(
      //   mediaGalleryModel: MediaGalleryModel(
      //     mediaModels: mediaModels,
      //     navigateOnTap: false,
      //     index: index,
      //   ),
      // ),
      onClosed: (removedMediaModels) {
        if (removedMediaModels == null) return;
        _onRemoved(context, removedMediaModels);
      },
    );
  }

  /// Actions on media removed pressed
  void _onRemoved(
    BuildContext context,
    List<MediaModel> removedMediaModels,
  ) {
    context.showSnackBar(S.of(context).notImplementedYet);
  }
}
