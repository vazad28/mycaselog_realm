import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/failures/app_failures.dart';
import '../case_timeline.dart';

class CaseTimelinePage extends ConsumerWidget {
  const CaseTimelinePage({super.key});

  static Page<void> page() =>
      const MaterialPage<void>(child: CaseTimelinePage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timelineItemsState = ref.watch(caseTimelineNotifierProvider);

    return timelineItemsState.maybeWhen(
      init: () => const LoadingSliver(child: SizedBox.shrink()),
      success: (data) => CaseTimelineView(timelineItems: data),
      failure: (failure) => LoadingSliver(text: failure.toLocalizedString()),
      orElse: () => const LoadingSliver(),
    );
  }
}
