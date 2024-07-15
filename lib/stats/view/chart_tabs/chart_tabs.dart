import 'package:app_ui/app_ui.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../stats.dart';

part 'bar_chart.dart';
part 'line_chart.dart';
part 'pie_chart.dart';

/// ChartTabsWidget ROOT Widget
class ChartTabsWidget extends ConsumerStatefulWidget {
  const ChartTabsWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChartTabsWidgetController();
}

/// ChartTabsWidget CONTROLLER Widget
class _ChartTabsWidgetController extends ConsumerState<ChartTabsWidget>
    with TickerProviderStateMixin {
  /// index of the chart tabs
  int currentIndex = 0;

  /// Tabs constroller
  late PageController pageController;

  final List<Widget> tabWidgets = const [
    KeepAliveWrapper(key: Key('BarChartTabKey'), child: BarChartTab()),
    KeepAliveWrapper(key: Key('LineChartTabKey'), child: LineChartTab()),
    KeepAliveWrapper(key: Key('PieChartTabKey'), child: PieChartTab()),
  ];

  @override
  void dispose() {
    debugPrint('chatsTab widget is disposed');
    super.dispose();
  }

  @override
  void initState() {
    pageController = ref.read(chartTabsControllerProvider);

    super.initState();
  }

  @override
  Widget build(BuildContext context) => _ChartTabsWidgetView(this);

  //-- Controller methods

  // ignore: use_setters_to_change_properties
  void onPageChanged(int index) => currentIndex = index;
}

/// ChartTabsWidget VIEW Widget
class _ChartTabsWidgetView
    extends WidgetView<ChartTabsWidget, _ChartTabsWidgetController> {
  const _ChartTabsWidgetView(super.state);

  @override
  Widget build(BuildContext context) {
    final pageViews = PageView.builder(
      controller: state.pageController,
      onPageChanged: state.onPageChanged,
      itemBuilder: (_, index) {
        // index gives you current page position.
        return Padding(
          padding: StatsConsts.chartPadding,
          child: state.tabWidgets.elementAt(index),
        );
      },
      itemCount: 3, // Can be null
    );

    return pageViews;
  }
}
