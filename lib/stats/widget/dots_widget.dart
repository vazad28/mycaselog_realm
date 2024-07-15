import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../stats.dart';

class StatsDotsWidget extends ConsumerWidget {
  const StatsDotsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(chartTabsControllerProvider);
    return SizedBox(
      height: StatsConsts.dotsHeight,
      child: DotsIndicator(
        key: const Key('__stats_dots_indicator_key'),
        itemCount: 3,
        controller: controller,
        color: context.onChartColor,
      ),
    );
  }
}
