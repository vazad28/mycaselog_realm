import 'package:app_models/app_models.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/app_vars.dart';
import '../../../core/failures/app_failures.dart';
import '../../stats.dart';

part '../../../generated/stats/provider/chart_providers/bar_chart_provider.g.dart';

class BarChartDataModel {
  BarChartDataModel({
    required this.titlesData,
    required this.barGroups,
    required this.barTouchData,
    this.failure,
  });

  factory BarChartDataModel.zero() => BarChartDataModel(
        titlesData: null,
        barGroups: null,
        barTouchData: null,
      );

  factory BarChartDataModel.failure(String failure) => BarChartDataModel(
        titlesData: null,
        barGroups: null,
        barTouchData: null,
        failure: failure,
      );

  final FlTitlesData? titlesData;
  final List<BarChartGroupData>? barGroups;
  final BarTouchData? barTouchData;
  final String? failure;
}

@riverpod
class BarChartDataGenerator extends _$BarChartDataGenerator {
  final rootContext = AppVars.appRootNavigatorKey.currentContext;

  @override
  BarChartDataModel build() {
    final statsDataModelAsync = ref.watch(statsDataProvider);

    final touchedIndex = ref.watch(touchedIndexProvider);

    return statsDataModelAsync.maybeWhen(
      success: (statsDataModel) => state =
          _createBarChartDataModel(statsDataModel, rootContext!, touchedIndex),
      failure: (f) => BarChartDataModel.failure(f.toLocalizedString()),
      orElse: BarChartDataModel.zero,
    );
  }

  BarChartDataModel _createBarChartDataModel(
    ChartDataModel chartDataModel,
    BuildContext context, [
    int? touchedIndex,
  ]) {
    final barChartGroups =
        _createBarChartGroups(chartDataModel, context, touchedIndex);

    return BarChartDataModel(
      barGroups: barChartGroups,
      barTouchData: ChartsHelper.barTouchData(touchedIndex, (int? index) {
        ref.read(touchedIndexProvider.notifier).update(index);
      }),
      titlesData: ChartsHelper.createChartTitlesData(chartDataModel),
    );
  }

  List<BarChartGroupData> _createBarChartGroups(
    ChartDataModel chartDataModel,
    BuildContext context, [
    int? touchedIndex,
  ]) {
    return chartDataModel.data.asMap().entries.map((entry) {
      final idx = entry.key;
      final item = entry.value;
      final isTouched = idx == touchedIndex;

      return BarChartGroupData(
        x: idx,
        barRods: [
          BarChartRodData(
            toY: isTouched
                ? item.data.length.toDouble() + 0.05
                : item.data.length.toDouble(),
            color: isTouched
                ? context.chartBackgroundColorDarker
                : context.onChartColor,
            width: chartDataModel.data.length < 13 ? 16 : null,
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: chartDataModel.maxValue,
              color: context.chartBackgroundColorDarker.withAlpha(150),
            ),
          ),
        ],
        showingTooltipIndicators: [0],
      );
    }).toList();
  }

  void load() {
    ref.notifyListeners();
  }
}
