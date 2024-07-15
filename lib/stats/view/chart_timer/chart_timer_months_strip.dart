part of './chart_timer.dart';

class ChartTimerMonthsStrip extends ConsumerWidget {
  const ChartTimerMonthsStrip({
    required this.controller,
    required this.onMonthSelect,
    super.key,
  });

  final ScrollController? controller;
  final void Function(int) onMonthSelect;

  Map<int, String> get monthList =>
      S.current.monthsNameShortList.split(',').map((e) => e).toList().asMap();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartReqModel = ref.watch(statsNotifierProvider);

    final monthsList = monthList.values.toList();

    return ListView.builder(
      controller: controller,
      itemExtent: MediaQuery.of(context).orientation == Orientation.portrait
          ? kChartTimerButtonWidthMonth
          : kChartTimerButtonHeight,
      shrinkWrap: true,
      //physics: const PageScrollPhysics(),
      scrollDirection:
          MediaQuery.of(context).orientation == Orientation.portrait
              ? Axis.horizontal
              : Axis.vertical,
      itemCount: monthsList.length,
      itemBuilder: (_, index) {
        //print(chartReqModel.currMonth);
        final isActive = chartReqModel.currMonth == (index + 1);
        return InkWell(
          onTap: () => onMonthSelect(index),
          child:
              ChartTimerButton(monthsList.elementAt(index), isActive: isActive),
        );
      },
    );
  }
}
