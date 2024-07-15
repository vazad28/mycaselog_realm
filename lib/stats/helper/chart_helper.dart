import 'package:app_models/app_models.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'widgets/chart_ticks.dart';

typedef OnTouchIndexChange = void Function(int? index);

abstract class ChartsHelper {
  static FlTitlesData createChartTitlesData(ChartDataModel chartDataModel) {
    final xLables = chartDataModel.data.map<String>((e) => e.label).toList();

    if (xLables.isEmpty) return const FlTitlesData();

    return FlTitlesData(
      rightTitles: const AxisTitles(),
      topTitles: const AxisTitles(),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (double value, TitleMeta meta) {
            final label = xLables[value.toInt()];
            return BottomAxisTick(label);
          },
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 28,
          interval: chartDataModel.interval,
          getTitlesWidget: (double value, TitleMeta meta) {
            final label = value.toInt().toString();
            return LeftAxisTick(label);
          },
        ),
      ),
    );
  }

  static BarTouchData barTouchData(
    int? currentIndex,
    OnTouchIndexChange onTouch,
  ) =>
      BarTouchData(
        touchCallback:
            (FlTouchEvent barTouchEvent, BarTouchResponse? barTouchResponse) {
          if (barTouchEvent is FlTapUpEvent) {
            final value = barTouchResponse?.spot?.touchedBarGroupIndex;
            currentIndex == value ? onTouch.call(null) : onTouch.call(value);
          }
        },
        handleBuiltInTouches: true,
        touchTooltipData: BarTouchTooltipData(
          //tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 0,
          getTooltipItem: (
            group,
            groupIndex,
            rod,
            rodIndex,
          ) {
            return null;
          },
        ),
      );

  static PieTouchData pieTouchData(
    int? currentIndex,
    OnTouchIndexChange onTouch,
  ) =>
      PieTouchData(
        enabled: true,
        touchCallback:
            (FlTouchEvent pieTouchEvent, PieTouchResponse? pieTouchResponse) {
          if (pieTouchEvent is FlTapUpEvent) {
            final value = pieTouchResponse?.touchedSection?.touchedSectionIndex;
            currentIndex == value ? onTouch.call(null) : onTouch.call(value);
            // if (ref.read(touchedIndexProvider) == value) {
            //   ref.read(touchedIndexProvider.notifier).state = null;
            // } else {
            //   ref.read(touchedIndexProvider.notifier).state = value;
            // }
          }
        },
      );

  static LineTouchData lineTouchData(
    ColorScheme colorScheme,
    int? currentIndex,
    OnTouchIndexChange onTouch,
  ) {
    return LineTouchData(
      enabled: false,
      getTouchedSpotIndicator: (barData, spotIndexes) {
        final color = colorScheme.primary.withAlpha(150);
        return spotIndexes.map((index) {
          return TouchedSpotIndicatorData(
            FlLine(color: color),
            FlDotData(
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: color,
                  strokeWidth: 2,
                  strokeColor: colorScheme.primary,
                );
              },
            ),
          );
        }).toList();
      },
      touchTooltipData: _lineTouchTooltipData(colorScheme),
      handleBuiltInTouches: false,
      touchCallback: (lineTouch, response) {
        if (lineTouch is FlTapUpEvent) {
          final value = response?.lineBarSpots?[0].spotIndex;
          currentIndex == value ? onTouch.call(null) : onTouch.call(value);
          // if (ref.read(touchedIndexProvider) == touchedIndex) {
          //   ref.read(touchedIndexProvider.notifier).state = null;
          // } else {
          //   ref.read(touchedIndexProvider.notifier).state = touchedIndex;
          // }
        }
      },
    );
  }

  static LineTouchTooltipData _lineTouchTooltipData(ColorScheme colorScheme) =>
      LineTouchTooltipData(
        //tooltipBgColor: colorScheme.primary,
        tooltipMargin: 8,
        tooltipPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        getTooltipItems: (lineBarsSpot) {
          return lineBarsSpot.map((lineBarSpot) {
            return LineTooltipItem(
              lineBarSpot.y.toString(),
              TextStyle(
                color: colorScheme.primaryContainer,
                fontWeight: FontWeight.bold,
              ),
            );
          }).toList();
        },
      );
}
