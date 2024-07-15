import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/app_vars.dart';
import '../../../core/failures/app_failures.dart';
import '../../stats.dart';

part '../../../generated/stats/provider/chart_providers/pie_chart_provider.g.dart';

class PieChartDataModel {
  PieChartDataModel({
    required this.sections,
    required this.pieTouchData,
    this.failure,
  });

  factory PieChartDataModel.zero() =>
      PieChartDataModel(sections: null, pieTouchData: null);

  factory PieChartDataModel.failure(String failure) =>
      PieChartDataModel(sections: null, pieTouchData: null, failure: failure);

  final List<PieChartSectionData>? sections;
  final PieTouchData? pieTouchData;
  final String? failure;
}

@riverpod
class PieChartDataGenerator extends _$PieChartDataGenerator {
  final rootContext = AppVars.appRootNavigatorKey.currentContext;
  @override
  PieChartDataModel build() {
    final statsDataModelState = ref.watch(statsDataProvider);

    final touchedIndex = ref.watch(touchedIndexProvider);

    return statsDataModelState.maybeWhen(
      success: (statsDataModel) =>
          _createPieChartDataModel(statsDataModel, rootContext!, touchedIndex),
      failure: (f) => PieChartDataModel.failure(f.toLocalizedString()),
      orElse: PieChartDataModel.zero,
    );
  }

  PieChartDataModel _createPieChartDataModel(
    ChartDataModel chartDataModel,
    BuildContext context, [
    int? touchedIndex,
  ]) {
    final pieChartSections =
        _createPieSections(chartDataModel, context, touchedIndex);

    return PieChartDataModel(
      sections: pieChartSections,
      pieTouchData: ChartsHelper.pieTouchData(touchedIndex, (int? index) {
        ref.watch(touchedIndexProvider.notifier).update(index);
      }),
    );
  }

  List<PieChartSectionData>? _createPieSections(
    ChartDataModel chartDataModel,
    BuildContext context, [
    int? selectedIndex,
  ]) {
    final factor = 250 ~/ chartDataModel.data.length;
    final textStyle = context.textTheme.bodySmall;

    return chartDataModel.data.asMap().entries.map((entry) {
      final idx = entry.key;
      final item = entry.value;
      final isTouched = idx == selectedIndex;

      final fontSize = isTouched ? 18 : 12;
      final radius = isTouched ? 105 : 95;

      return PieChartSectionData(
        color: context.onChartColor.withAlpha(255 - factor * idx),
        value: item.data.length.toDouble(),
        title: item.data.length.toString(),
        radius: radius.toDouble(),
        badgeWidget: Text(
          item.label,
          style: textStyle?.copyWith(color: context.onChartColor),
        ),
        badgePositionPercentageOffset: 1.25,
        titleStyle: textStyle?.copyWith(
          fontSize: fontSize.toDouble(),
          fontWeight: FontWeight.bold,
          color: context.colorScheme.onPrimaryContainer,
        ),
      );
    }).toList();
  }

  void load() {
    ref.notifyListeners();
  }
}
