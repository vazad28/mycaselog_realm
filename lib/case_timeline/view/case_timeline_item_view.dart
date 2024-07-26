import 'package:animations/animations.dart';
import 'package:app_extensions/app_extensions.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:misc_packages/misc_packages.dart';

import '../../core/app_mixins.dart';
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
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CaseTimelineItemViewState();
}

class _CaseTimelineItemViewState extends ConsumerState<CaseTimelineItemView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: kMinInteractiveDimension,
          padding: const EdgeInsets.only(
            left: kToolbarHeight + (kMinInteractiveDimension * 0.5),
            bottom: 8,
          ),
          width: double.infinity,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              widget.timelineItemOriginal.eventTimestamp.formatMDY(),
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colorScheme.onSurface,
              ),
            ),
          ),
        ),
        Container(
          color: Colors.transparent,
          margin: const EdgeInsets.only(top: 42, left: 8, right: 8),
          child: Material(
            type: MaterialType.card,
            borderRadius: BorderRadius.circular(12),
            shadowColor: context.colorScheme.shadow.withOpacity(0.2),
            elevation: 1,
            child: MaterialCard.outlined(
              borderColor: context.colorScheme.surfaceContainerHighest,
              padding: EdgeInsets.zero,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CaseTimelineItemHeader(
                    key: Key(
                      '__CaseTimelineHeader-${widget.timelineItemOriginal.id}',
                    ),
                    timelineItemModel: widget.timelineItemOriginal,
                  ),
                  CaseTimelineItemMedia(
                    key: Key(
                      '__CaseTimelineMedia-${widget.timelineItemOriginal.id}',
                    ),
                    timelineItemModel: widget.timelineItemOriginal,
                  ),
                  CaseTimelineItemNotes(
                    key: Key(
                      '__CaseTimelineNotes-${widget.timelineItemOriginal.id}',
                    ),
                    timelineItemModel: widget.timelineItemOriginal,
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(left: kMinInteractiveDimension, top: 32),
          width: 18,
          height: 18,
          child: const TargetShapeCircle(),
        ),
        Container(
          padding: const EdgeInsets.only(left: kToolbarHeight),
          width: 4,
          height: 32,
          child: VerticalDivider(
            color: context.colorScheme.surfaceContainerHighest,
            thickness: 2,
            width: kMinInteractiveDimension * 0.5,
          ),
        ),
      ],
    );
  }
}
