import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/app_vars.dart';
import '../../../core/failures/app_failures.dart';
import '../../stats.dart';

part '../../../generated/stats/provider/chart_providers/line_chart_provider.g.dart';

class LineChartDataModel {
  LineChartDataModel({
    required this.showingTooltipIndicators,
    required this.titlesData,
    required this.lineBarsData,
    required this.lineTouchData,
    this.failure,
  });

  factory LineChartDataModel.zero() => LineChartDataModel(
        showingTooltipIndicators: null,
        titlesData: null,
        lineBarsData: null,
        lineTouchData: null,
      );

  factory LineChartDataModel.failure(String failure) => LineChartDataModel(
        showingTooltipIndicators: null,
        titlesData: null,
        lineBarsData: null,
        lineTouchData: null,
        failure: failure,
      );

  final List<ShowingTooltipIndicators>? showingTooltipIndicators;
  final FlTitlesData? titlesData;
  final List<LineChartBarData>? lineBarsData;
  final LineTouchData? lineTouchData;
  final String? failure;
}

@riverpod
class LineChartDataGenerator extends _$LineChartDataGenerator {
  @override
  LineChartDataModel build() {
    final rootContext = AppVars.appRootNavigatorKey.currentContext;

    final statsDataModelState = ref.watch(statsDataProvider);

    final touchedIndex = ref.watch(touchedIndexProvider);

    final indexes =
        (touchedIndex != null && touchedIndex != -1) ? [touchedIndex] : null;

    return statsDataModelState.maybeWhen(
      success: (statsDataModel) => _createLineChartDataModel(
        statsDataModel,
        rootContext!,
        indexes,
        touchedIndex,
      ),
      failure: (f) => LineChartDataModel.failure(f.toLocalizedString()),
      orElse: LineChartDataModel.zero,
    );
  }

  LineChartDataModel _createLineChartDataModel(
    ChartDataModel chartDataModel,
    BuildContext context, [
    List<int>? indexes,
    int? touchedIndex,
  ]) {
    final lineBarsData =
        _createDataGroups(indexes, _allSpots(chartDataModel), context);

    return LineChartDataModel(
      lineBarsData: lineBarsData,
      lineTouchData: ChartsHelper.lineTouchData(
          context.colorScheme, touchedIndex, (int? index) {
        ref.watch(touchedIndexProvider.notifier).update(index);
      }),
      titlesData: ChartsHelper.createChartTitlesData(chartDataModel),
      showingTooltipIndicators: indexes?.map((index) {
        return ShowingTooltipIndicators([
          LineBarSpot(lineBarsData.first, 0, lineBarsData.first.spots[index]),
        ]);
      }).toList(),
    );
  }

  List<FlSpot> _allSpots(ChartDataModel chartDataModel) {
    final spots = chartDataModel.data.asMap().entries.map((entry) {
      final idx = entry.key;
      final item = entry.value;
      return FlSpot(idx.toDouble(), item.data.length.toDouble());
    }).toList();
    return spots;
  }

  List<LineChartBarData> _createDataGroups(
    List<int>? showIndexes,
    List<FlSpot> allSpots,
    BuildContext context,
  ) {
    final lineChartSet = LineChartBarData(
      showingIndicators: showIndexes ?? [],
      spots: allSpots,
      isCurved: true,
      belowBarData: BarAreaData(
        show: true,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            context.onChartColor.withAlpha(50),
            context.chartBackgroundColor.withAlpha(100),
          ],
        ),
      ),
      color: context.onChartColor,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
    );

    return [lineChartSet];
  }

  void load() {
    ref.notifyListeners();
  }
}
