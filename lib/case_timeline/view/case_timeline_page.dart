import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../case_timeline.dart';

class CaseTimelinePage extends ConsumerWidget {
  const CaseTimelinePage({super.key});

  static Page<void> page() =>
      const MaterialPage<void>(child: CaseTimelinePage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timelineItemsAsync = ref.watch(caseTimelineNotifierProvider);

    //print(timelineItemsAsync.requireValue);

    // return AsyncValueSliverWidget(
    //   value: timelineItemsAsync,
    //   data: (data) {
    //     return CaseTimelineView(timelineItems: data);
    //   },
    // );

    return timelineItemsAsync.when(
      //init: () => const LoadingSliver(child: SizedBox.shrink()),
      data: (data) => CaseTimelineView(timelineItems: data),
      error: (failure, st) => LoadingSliver(text: failure.toString()),
      loading: () => const LoadingSliver(),
    );
  }
}
