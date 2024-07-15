part of 'chart_tabs.dart';

/// LineChartTab ROOT Widget
class LineChartTab extends ConsumerStatefulWidget {
  const LineChartTab({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LineChartTabController();
}

/// LineChartTab CONTROLLER Widget
class _LineChartTabController extends ConsumerState<LineChartTab> {
  LineChartDataModel _lineChartDataModel = LineChartDataModel.zero();

  @override
  Widget build(BuildContext context) {
    ref.listen<LineChartDataModel>(lineChartDataGeneratorProvider, (_, next) {
      setState(() => _lineChartDataModel = next);
    });

    return _LineChartTabView(this);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(lineChartDataGeneratorProvider.notifier).load();
    });
  }
}

/// LineChartTab VIEW Widget
class _LineChartTabView
    extends WidgetView<LineChartTab, _LineChartTabController> {
  const _LineChartTabView(super.state);

  @override
  Widget build(BuildContext context) {
    final chartDataModel = state._lineChartDataModel;

    if (chartDataModel == LineChartDataModel.zero()) {
      return const SizedBox.shrink();
    }

    if (chartDataModel.failure != null) {
      return NoChartsData(
        text: chartDataModel.failure,
      );
    }
    return LineChart(
      LineChartData(
        showingTooltipIndicators: chartDataModel.showingTooltipIndicators ??
            <ShowingTooltipIndicators>[],
        lineTouchData: chartDataModel.lineTouchData ?? const LineTouchData(),
        lineBarsData: chartDataModel.lineBarsData ?? <LineChartBarData>[],
        minY: 0,
        titlesData: chartDataModel.titlesData ?? const FlTitlesData(),
        borderData: FlBorderData(show: false),
        gridData: const FlGridData(show: false),
      ),
      //swapAnimationDuration: StatsConsts.chartsAnimSwapDuration,
      //swapAnimationCurve: StatsConsts.chartsAnimSwapCurve,
    );
  }
}
