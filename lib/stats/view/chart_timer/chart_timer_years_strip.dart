part of './chart_timer.dart';

class ChartTimerYearsStrip extends ConsumerWidget {
  const ChartTimerYearsStrip({
    required this.onYearSelect,
    super.key,
    this.controller,
  });

  final ScrollController? controller;
  final void Function(int) onYearSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final yearsList = ref.watch(statsRepositoryProvider).getYearList();

    return (yearsList?.isEmpty ?? true)
        ? const SizedBox(height: kChartTimerButtonHeight)
        : _YearListWidget(
            controller: controller,
            onYearSelect: onYearSelect,
            yearsList: yearsList!,
          );
  }
}

class _YearListWidget extends ConsumerWidget {
  const _YearListWidget({
    required this.controller,
    required this.onYearSelect,
    required this.yearsList,
  });

  final ScrollController? controller;
  final void Function(int) onYearSelect;
  final List<int> yearsList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chartReqModel = ref.watch(statsNotifierProvider);

    return ListView.builder(
      itemExtent: MediaQuery.of(context).orientation == Orientation.portrait
          ? kChartTimerButtonWidthYear
          : kChartTimerButtonHeight,
      shrinkWrap: true,
      itemBuilder: (content, index) {
        final y = yearsList[index];
        final isActive = chartReqModel.currYear == y;
        return InkWell(
          onTap: () => onYearSelect(y),
          child: ChartTimerButton(y.toString(), isActive: isActive),
        );
      },
      itemCount: yearsList.length,
      scrollDirection:
          MediaQuery.of(context).orientation == Orientation.portrait
              ? Axis.horizontal
              : Axis.vertical,
      controller: controller,
    );
  }
}
