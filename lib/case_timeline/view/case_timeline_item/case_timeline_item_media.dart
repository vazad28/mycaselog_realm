part of '../case_timeline_item_view.dart';

class CaseTimelineItemMedia extends ConsumerWidget with AppMixins {
  const CaseTimelineItemMedia({
    required this.timelineItemModel,
    super.key,
  });

  final TimelineItemModel timelineItemModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaModels = timelineItemModel.mediaList;

    if (mediaModels.isEmpty) return const SizedBox.shrink();

    final crossAxisCount = (MediaQuery.of(context).size.width / 120).ceil();
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
          children: mediaModels
              .mapIndexed(
                (index, mediaModel) => OpenContainer<List<MediaModel>?>(
                  closedElevation: 0,
                  closedColor: Colors.transparent,
                  openColor: Colors.transparent,
                  tappable: false,
                  closedBuilder: (_, action) => Thumbnail(
                    mediaModel: mediaModel,
                    width: width,
                    onTap: action,
                  ),
                  openBuilder: (_, __) => MediaGalleryPage(
                    mediaGalleryModel: MediaGalleryModel(
                      mediaModels: mediaModels,
                      navigateOnTap: false,
                      index: index,
                    ),
                  ),
                  onClosed: (removedMediaModels) {
                    hideBottomNavbar(ref);

                    // if (removedMediaModels == null) return;
                    // _onRemoved(context, removedMediaModels);
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  void _onRemoved(
    BuildContext context,
    List<MediaModel> removedMediaModels,
  ) {
    context.showSnackBar(S.of(context).notImplementedYet);
  }
}
