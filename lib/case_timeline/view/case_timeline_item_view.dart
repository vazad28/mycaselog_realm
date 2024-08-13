import 'package:animations/animations.dart';
import 'package:app_extensions/app_extensions.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/app_mixins.dart';
import '../../core/providers/providers.dart';
import '../../media_gallery/media_gallery.dart';
import '../case_timeline.dart';

part 'case_timeline_item/case_timeline_item_header.dart';
part 'case_timeline_item/case_timeline_item_media.dart';
part 'case_timeline_item/case_timeline_item_notes.dart';

class CaseTimelineItemView extends ConsumerStatefulWidget {
  const CaseTimelineItemView({
    required this.timelineItemOriginal,
    required this.isFirst,
    super.key,
  });

  final TimelineItemModel timelineItemOriginal;
  final bool isFirst;

  @override
  // ignore: library_private_types_in_public_api
  _CaseTimelineItemViewState createState() => _CaseTimelineItemViewState();
}

class _CaseTimelineItemViewState extends ConsumerState<CaseTimelineItemView> {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Stack(
      children: [
        // Date Container
        Container(
          height: kMinInteractiveDimension,
          padding: const EdgeInsets.only(
            left: kToolbarHeight + (kMinInteractiveDimension * 0.5),
            bottom: 8,
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              widget.timelineItemOriginal.eventTimestamp.formatMDY(),
              style:
                  textTheme.labelSmall?.copyWith(color: colorScheme.onSurface),
            ),
          ),
        ),
        // Card Container
        Container(
          color: Colors.transparent,
          margin: const EdgeInsets.only(top: 42, left: 8, right: 8),
          child: Material(
            type: MaterialType.card,
            borderRadius: BorderRadius.circular(8),
            shadowColor: colorScheme.shadow.withOpacity(0.2),
            elevation: 2,
            child: MaterialCard.outlined(
              borderColor: colorScheme.surfaceContainerHighest,
              padding: EdgeInsets.zero,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  CaseTimelineItemHeader(
                    key: Key(
                        '__CaseTimelineHeader-${widget.timelineItemOriginal.id}',),
                    timelineItemModel: widget.timelineItemOriginal,
                  ),
                  // Media
                  CaseTimelineItemMedia(
                    key: Key(
                        '__CaseTimelineMedia-${widget.timelineItemOriginal.id}',),
                    timelineItemModel: widget.timelineItemOriginal,
                  ),
                  // Notes
                  CaseTimelineItemNotes(
                    key: Key(
                        '__CaseTimelineNotes-${widget.timelineItemOriginal.id}',),
                    timelineItemModel: widget.timelineItemOriginal,
                  ),
                ],
              ),
            ),
          ),
        ),
        // Target Shape Container
        Container(
          margin:
              const EdgeInsets.only(left: kMinInteractiveDimension, top: 32),
          child: const TargetShapeCircle(),
        ),
        // Vertical Divider Container
        Container(
          padding: const EdgeInsets.only(left: kToolbarHeight),
          child: VerticalDivider(
            color: colorScheme.surfaceContainerHighest,
            thickness: 2,
          ),
        ),
      ],
    );
  }
}
