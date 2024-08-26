enum ChartTypes { line, bar, pie }

enum StatsGroupBy { day, month, year }

/// Contains each chart data item
class ChartDataItem {
  ChartDataItem(this.label, this.data);

  // list of caseIDs
  final Iterable<String> data;

  final String label;
}

/// class to hold the data to use by charts library
/// interval - to plot interval on chart
/// Max value to squuze the chart in given space
/// And data item as list of chartDataItems
///
class ChartDataModel {
  ChartDataModel({
    required this.data,
    required this.maxValue,
    required this.interval,
  });

  factory ChartDataModel.zero() =>
      ChartDataModel(data: [], interval: 1, maxValue: 1);

  final List<ChartDataItem> data;
  final double interval;
  final double maxValue;
}

class ChartReqModel {
  ChartReqModel({
    this.activeTab = 0,
    this.chartData,
    this.chartType = ChartTypes.bar,
    this.currMonth,
    this.currYear,
    this.filterClause,
    this.fromStamp,
    this.groupByLabel = StatsGroupBy.day,
    this.searchTerm,
    this.toStamp,
  });

  final int activeTab;
  final ChartDataModel? chartData;
  final ChartTypes chartType;

  final int? currMonth;
  final int? currYear;
  final String? filterClause;
  final DateTime? fromStamp;
  final StatsGroupBy groupByLabel;

  final String? searchTerm;
  final DateTime? toStamp;

  ChartReqModel copyWith({
    int? activeTab,
    ChartDataModel? chartData,
    ChartTypes? chartType,
    int? currMonth,
    int? currYear,
    String? filterClause,
    DateTime? fromStamp,
    StatsGroupBy? groupByLabel,
    String? searchTerm,
    DateTime? toStamp,
  }) =>
      ChartReqModel(
        activeTab: activeTab ?? this.activeTab,
        chartData: chartData ?? this.chartData,
        chartType: chartType ?? this.chartType,

        /// dont set this.currMonth or this.searchTerm else
        /// these will never be set to null
        currMonth: currMonth,
        currYear: currYear ?? this.currYear,
        filterClause: filterClause,
        fromStamp: fromStamp ?? this.fromStamp,
        groupByLabel: groupByLabel ?? this.groupByLabel,
        searchTerm: searchTerm,
        toStamp: toStamp ?? this.toStamp,
      );
}
