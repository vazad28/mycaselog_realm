import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../stats.dart';

part './chart_timer_button.dart';
part './chart_timer_months_strip.dart';
part './chart_timer_years_strip.dart';

typedef OnMonthSelect = void Function(int);
typedef OnYearSelect = void Function(int);

/// ChartTimer ROOT Widget
class ChartTimer extends ConsumerStatefulWidget {
  const ChartTimer({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChartTimerController();
}

/// ChartTimer CONTROLLER Widget
class _ChartTimerController extends ConsumerState<ChartTimer> {
  final _monthsController = ScrollController();
  final _yearsController = ScrollController();

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final chartReqModel = ref.read(statsNotifierProvider);
      final currMonthIndex = chartReqModel.currMonth ?? 0;

      if (MediaQuery.of(context).orientation == Orientation.portrait) {
        _animateMonth(
          MediaQuery.of(context).size.width <
                  currMonthIndex * kChartTimerButtonWidthMonth
              ? currMonthIndex
              : 0,
          kChartTimerButtonWidthMonth,
        );
      } else {
        _animateMonth(
          MediaQuery.of(context).size.height <
                  currMonthIndex * kChartTimerButtonWidthMonth
              ? currMonthIndex
              : 0,
          kChartTimerButtonHeight,
        );
      }
    });

    super.initState();
  }

  void _animateMonth(int index, double offset) {
    final distance = (index - 1) * offset;
    if (_monthsController.hasClients) {
      _monthsController.animateTo(
        distance,
        curve: Curves.ease,
        duration: const Duration(milliseconds: 300),
      );
    }
  }

  @override
  void dispose() {
    _monthsController.dispose();
    _yearsController.dispose();
    super.dispose();
  }

  /// Widget builder method
  @override
  Widget build(BuildContext context) => _ChartTimerView(this);

  /// controller methods
  List<Widget> get timerChildren => [
        ChartTimerMonthsStrip(
          controller: _monthsController,
          onMonthSelect: (int index) =>
              ref.watch(statsNotifierProvider.notifier).onMonthSelect(index),
        ),
        ChartTimerYearsStrip(
          controller: _yearsController,
          onYearSelect: (int index) =>
              ref.watch(statsNotifierProvider.notifier).onYearSelect(index),
        ),
      ];
}

/// ChartTimer VIEW Widget
class _ChartTimerView extends WidgetView<ChartTimer, _ChartTimerController> {
  const _ChartTimerView(super.state);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              children: [
                const Divider(height: 1),
                const SizedBox(height: 8),
                Expanded(child: state.timerChildren.first),
                const SizedBox(height: 4),
                Expanded(child: state.timerChildren.last),
              ],
            ),
          )
        : Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                const Divider(height: 1),
                const SizedBox(width: 8),
                Expanded(child: state.timerChildren.first),
                const SizedBox(width: 16),
                Expanded(child: state.timerChildren.last),
                const SizedBox(width: 8),
              ],
            ),
          );
  }
}
