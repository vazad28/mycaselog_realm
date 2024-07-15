import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

extension ChartColorsExt on BuildContext {
  /// chart colors scheme
  Color get chartBackgroundColor =>
      Theme.of(this).brightness == Brightness.light
          ? Theme.of(this).colorScheme.primary
          : Theme.of(this).colorScheme.surfaceTint;

  Color get chartBackgroundColorDarker => chartBackgroundColor.darker();
  Color get onChartColor => Theme.of(this).colorScheme.onPrimary;

  /// stats timer colors
  Color get chartTimerBackgroundColor => chartBackgroundColor;
  Color get chartTimerInactiveColor => Theme.of(this).colorScheme.onPrimary;
  Color get chartTimerInactiveOnColor => Theme.of(this).colorScheme.primary;
  Color get chartTimerActiveColor => Theme.of(this).colorScheme.onPrimary;
  Color get chartTimerActiveOnColor => Theme.of(this).colorScheme.primary;
}
