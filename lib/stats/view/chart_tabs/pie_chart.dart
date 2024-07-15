part of 'chart_tabs.dart';

/// PieChartTab ROOT Widget
class PieChartTab extends ConsumerStatefulWidget {
  const PieChartTab({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PieChartTabController();
}

/// PieChartTab CONTROLLER Widget
class _PieChartTabController extends ConsumerState<PieChartTab> {
  PieChartDataModel _pieChartDataModel = PieChartDataModel.zero();

  @override
  Widget build(BuildContext context) {
    ref.listen<PieChartDataModel>(pieChartDataGeneratorProvider, (_, next) {
      setState(() => _pieChartDataModel = next);
    });

    return _PieChartTabView(this);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(pieChartDataGeneratorProvider.notifier).load();
    });

    super.initState();
  }
}

/// PieChartTab VIEW Widget
class _PieChartTabView extends WidgetView<PieChartTab, _PieChartTabController> {
  const _PieChartTabView(super.state);

  @override
  Widget build(BuildContext context) {
    final chartDataModel = state._pieChartDataModel;

    if (chartDataModel == PieChartDataModel.zero()) {
      return const SizedBox.shrink();
    }

    if (chartDataModel.failure != null) {
      return NoChartsData(
        text: chartDataModel.failure,
      );
    }
    return PieChart(
      PieChartData(
        pieTouchData: chartDataModel.pieTouchData,
        borderData: FlBorderData(
          show: false,
        ),
        sectionsSpace: 0,
        centerSpaceRadius: 24,
        sections: chartDataModel.sections,
      ),
      swapAnimationDuration: StatsConsts.chartsAnimSwapDuration,
      swapAnimationCurve: StatsConsts.chartsAnimSwapCurve,
    );
  }
}
