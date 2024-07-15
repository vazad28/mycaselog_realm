import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../stats.dart';
import 'chart_tabs/chart_tabs.dart';
import 'chart_timer/chart_timer.dart';

class StatsView extends ConsumerWidget {
  const StatsView(this.orientation, {super.key});
  final Orientation orientation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return orientation == Orientation.portrait
        ? const StatsBodyPortrait()
        : const StatsBodyLandscape();
  }
}

///
/// Stats body protrait
class StatsBodyPortrait extends StatelessWidget {
  const StatsBodyPortrait({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final availableHeight = constraints.maxHeight;

        /// half of height
        final chartWidgetHeight = availableHeight * 0.5;

        final statCaseViewerHeight = availableHeight * 0.5 -
            (StatsConsts.timerHeight + StatsConsts.dotsHeight + 16);

        final initialChildSize =
            availableHeight == 0 ? 0.0 : statCaseViewerHeight / availableHeight;

        return Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            ColoredBox(
              color: context.chartBackgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: StatsConsts.dotsHeight),
                  const StatsDotsWidget(),
                  SizedBox(
                    height: chartWidgetHeight,
                    child: const ChartTabsWidget(),
                  ),
                  SizedBox(
                    height: StatsConsts.timerHeight,
                    child: ColoredBox(
                      color: context.chartTimerBackgroundColor,
                      child: const ChartTimer(),
                    ),
                  ),
                ],
              ),
            ),
            StatsCasesViewer(
              key: const Key('__stats_cases_viewer__'),
              initialChildSize: initialChildSize,
            ),
          ],
        );
      },
    );
  }
}

/// Stats body landscape
class StatsBodyLandscape extends StatelessWidget {
  const StatsBodyLandscape({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final availableHeight = constraints.maxHeight;
        return Container(
          height: availableHeight,
          color: context.chartBackgroundColor,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(
                child: ChartTabsWidget(),
              ),
              SizedBox(
                width: StatsConsts.landscapeStatsTimerWidth,
                height: availableHeight,
                child: const ChartTimer(),
              ),
            ],
          ),
        );
      },
    );
  }
}
