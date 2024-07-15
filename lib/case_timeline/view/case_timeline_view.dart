import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'case_timeline_item_view.dart';

class CaseTimelineView extends ConsumerWidget {
  const CaseTimelineView({required this.timelineItems, super.key});

  final List<TimelineItemModel> timelineItems;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// put the list of case timeline items here
    if (timelineItems.isEmpty) {
      return LoadingSliver(
        text: S.of(context).noTimelineItems,
      );
    }

    return SliverList.builder(
      key: ValueKey(timelineItems),
      itemBuilder: (BuildContext context, int index) => CaseTimelineItemView(
        timelineItemOriginal: timelineItems[index],
        isFirst: index == 0,
      ),
      itemCount: timelineItems.length,
    );
  }
}
