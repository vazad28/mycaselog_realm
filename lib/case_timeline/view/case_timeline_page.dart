import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/core.dart';
import '../case_timeline.dart';
import 'case_timeline_item_view.dart';

class CaseTimelinePage extends ConsumerWidget {
  const CaseTimelinePage({required this.caseID, super.key});

  final String caseID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueSliverWidget<List<TimelineItemModel>>(
      value: ref.watch(caseTimelineNotifierProvider(caseID)),
      data: (timelineItems) {
        return SliverList.builder(
          itemCount: timelineItems.length,
          itemBuilder: (context, index) {
            return CaseTimelineItemView(
              timelineItemOriginal: timelineItems[index],
              isFirst: index == 0,
            );
          },
        );
      },
    );
  }
}
