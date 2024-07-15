part of 'chart_tabs.dart';

/// BarChartTab ROOT Widget
class BarChartTab extends ConsumerStatefulWidget {
  const BarChartTab({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BarChartTabController();
}

/// BarChartTab CONTROLLER Widget
class _BarChartTabController extends ConsumerState<BarChartTab> {
  BarChartDataModel _barChartDataModel = BarChartDataModel.zero();

  @override
  Widget build(BuildContext context) {
    ref.listen<BarChartDataModel>(barChartDataGeneratorProvider, (_, next) {
      setState(() => _barChartDataModel = next);
    });

    return _BarChartTabView(this);
  }
}

/// BarChartTab VIEW Widget
class _BarChartTabView extends WidgetView<BarChartTab, _BarChartTabController> {
  const _BarChartTabView(super.state);

  @override
  Widget build(BuildContext context) {
    final chartDataModel = state._barChartDataModel;

    if (chartDataModel == BarChartDataModel.zero()) {
      return const SizedBox.shrink();
    }

    if (chartDataModel.failure != null) {
      return NoChartsData(
        text: chartDataModel.failure,
      );
    }

    return BarChart(
      swapAnimationDuration: StatsConsts.chartsAnimSwapDuration,
      swapAnimationCurve: StatsConsts.chartsAnimSwapCurve,
      BarChartData(
        alignment: BarChartAlignment.spaceEvenly,
        barTouchData: chartDataModel.barTouchData,
        titlesData: chartDataModel.titlesData,
        borderData: FlBorderData(show: false),
        gridData: const FlGridData(show: false),
        barGroups: chartDataModel.barGroups,
      ),
    );
  }
}
