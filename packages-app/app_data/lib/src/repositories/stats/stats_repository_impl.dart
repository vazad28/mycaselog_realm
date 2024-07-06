// ignore_for_file: constant_identifier_names

import 'dart:math' as math show ln10, log, max, min, pow;

import 'package:app_extensions/app_extensions.dart';
import 'package:app_models/app_models.dart';
import 'package:async_result/async_result.dart';
import 'package:logger_client/logger_client.dart';

import '../../../../app_data.dart';

part 'stats_repository.dart';

enum MonthsList { Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec }

class StatsRepositoryImpl with LoggerMixin implements StatsRepository {
  StatsRepositoryImpl({
    required DatabaseService databaseService,
    required FtsSearchRepository ftsSearch,
  })  : _databaseService = databaseService,
        _ftsSearch = ftsSearch;

  final DatabaseService _databaseService;
  final FtsSearchRepository _ftsSearch;

  ///get full text search result ids
  Future<List<String>?> _getSearchIds(String searchTermProcessed) async {
    final searchRes = await _ftsSearch.searchCaseMedia(searchTermProcessed);
    if (searchRes.isEmpty) return null;
    return searchRes.map((item) => item['caseID'].toString()).toList();
  }

  /// Fetch statistics
  @override
  Future<Result<ChartReqModel, RepositoryFailure>> getStatistics(
    ChartReqModel chartReqModel,
  ) async {
    final fromStamp = chartReqModel.fromStamp?.millisecondsSinceEpoch ?? 0;
    final toStamp = chartReqModel.toStamp?.millisecondsSinceEpoch ?? 0;

    assert(toStamp > fromStamp, 'From time can not be less than To time');

    // /must keep this null coz getFtsCaseIds can return null
    List<String>? idList;

    // if we have search term or filter term (just processed search term)
    // fill in the idlist
    if (chartReqModel.filterClause != null) {
      idList = await _getSearchIds(chartReqModel.filterClause!);

      if (idList?.isEmpty ?? true) {
        return Result.failure(const RepositoryFailure.noStatsData());
      }
    } else if (chartReqModel.searchTerm != null) {
      // String searchTermProcessed;
      // final split = chartReqModel.searchTerm?.split(RegExp(r'\s+')) ?? [];
      // if (split.length > 1) {
      //   searchTermProcessed = split.map((term) => '$term*').join(' ');
      // } else {
      //   searchTermProcessed = '${chartReqModel.searchTerm}*';
      // }
      idList = await _getSearchIds(chartReqModel.searchTerm!);

      if (idList?.isEmpty ?? true) {
        return Result.failure(const RepositoryFailure.noStatsData());
      }
    }

    final caseModels = _databaseService.casesCollection.casesBetweenTimestamp(
      fromTimestamp: fromStamp,
      toTimestamp: toStamp,
      idList: idList,
    );

    /// important to throw failure here else there is lot of null
    /// checks and other errors
    if (caseModels.isEmpty) {
      return Result.failure(const RepositoryFailure.noStatsData());
    }

    /// converts the case model list into a map by grouping by the group label
    final chartDataGroupedMap = _fetchChartDataGroupedByLabel(
      chartReqModel.groupByLabel,
      caseModels,
    );

    return Result.success(
      chartReqModel.copyWith(
        chartData: _createChartsData(chartDataGroupedMap),
      ),
    );
  }

  @override
  Future<Result<UserStatsModel, RepositoryFailure>> getUserStats() async {
    try {
      final casesCount = _databaseService.casesCollection.countAll();

      final mediaCount = _databaseService.mediaCollection.countAll();

      final notesCount = _databaseService.timelineNotesCollection.countAll();

      return Result.success(
        UserStatsModel(cases: casesCount, media: mediaCount, notes: notesCount),
      );
    } catch (err) {
      return Result.failure(RepositoryFailure.fromError(err));
    }
  }

  @override
  Future<List<CaseModel>> getStatsCases(List<String> idList) async {
    final caseModels = _databaseService.casesCollection.getAllByCaseIDs(idList);
    return caseModels.nonNulls.toList();
  }

  ///List of years to select in plotting graph
  @override
  Future<List<int>?> getYearList() async {
    final earliestSurgeryTimestamp =
        _databaseService.casesCollection.firstCaseYear();

    if (earliestSurgeryTimestamp == null) return [];

    List<int>? years;

    final currYear = DateTime.now().year;
    final firstSurgeryYear =
        DateTime.fromMillisecondsSinceEpoch(earliestSurgeryTimestamp).year;

    final numYearsSinceFirstSurgery = (currYear - firstSurgeryYear) + 1;

    if (numYearsSinceFirstSurgery > 0) {
      years =
          List.generate(numYearsSinceFirstSurgery, (i) => firstSurgeryYear + i);
    }

    return years?.reversed.toList() ?? [DateTime.now().year];
  }

  /// ////////////////////////////////////////////////////////////////////
  /// local methods
  /// ////////////////////////////////////////////////////////////////////
  double _calcStepSize(double range, int targetSteps) {
    // calculate an initial guess at step size
    final tempStep = range / targetSteps;

    // get the magnitude of the step size
    final mag = (math.log(tempStep) / math.ln10).floor();
    final magPow = math.pow(10, mag);

    // calculate most significant digit of the new step size
    var magMsd = tempStep / magPow + 0.5;

    // promote the MSD to either 1, 2, or 5
    if (magMsd > 5.0) {
      magMsd = 10.0;
    } else if (magMsd > 2.0) {
      magMsd = 5.0;
    } else if (magMsd > 1.0) {
      magMsd = 2.0;
    }

    return magMsd * magPow;
  }

  Map<String, Iterable<String>> _fetchChartDataGroupedByLabel(
    StatsGroupBy groupByLabel,
    List<CaseModel> data,
  ) {
    Map<String, Iterable<String>> chartDataMap;

    switch (groupByLabel) {
      case StatsGroupBy.month:

        /// Form grouping by momth, this being string keys the order of months
        /// is not in corret order so we have to order by the MonthsList enum
        final unSortedChartDataMap = data
            .groupBy((g) => g.surgeryM)
            .mapValue((value) => value.map((e) => e.caseID));

        final months =
            MonthsList.values.names.map((e) => e.toLowerCase()).toList();

        chartDataMap = Map.fromEntries(
          unSortedChartDataMap.entries.toList()
            ..sort(
              (a, b) =>
                  months.indexOf(a.key.toLowerCase()) -
                  months.indexOf(b.key.toLowerCase()),
            ),
        );

      case StatsGroupBy.year:
        chartDataMap = data
            .groupBy((g) => g.surgeryY)
            .mapValue((value) => value.map((e) => e.caseID));

      case StatsGroupBy.day:
        final unsortedChartDataModel = data
            .groupBy((g) => g.surgeryD)
            .mapValue((value) => value.map((e) => e.caseID));

        /// sort by date
        chartDataMap = Map.fromEntries(
          unsortedChartDataModel.entries.toList()
            ..sort((e1, e2) => e1.key.compareTo(e2.key)),
        );
    }

    return chartDataMap;
  }

  ///
  /// Take the map of the data grouped by the GroupBy and convert it into
  /// list of dataItem with each containg max, min and count for the
  /// chart to display
  ChartDataModel _createChartsData(Map<String, Iterable<String>> chartDataMap) {
    final data =
        chartDataMap.entries.map((e) => ChartDataItem(e.key, e.value)).toList();

    final dataCount = data.map<int>((e) => e.data.length);

    if (dataCount.isEmpty) {
      return ChartDataModel(data: data, maxValue: 0, interval: 1);
    }

    final maxValue = dataCount.reduce(math.max);
    final minValue = dataCount.reduce(math.min);

    final interval = maxValue - minValue;

    final intervalStep = interval > 0
        ? _calcStepSize(
            (maxValue - minValue).toDouble(),
            (maxValue / minValue).round(),
          )
        : 1.0;

    final chartDataModel = ChartDataModel(
      data: data,
      maxValue: maxValue.toDouble(),
      interval: intervalStep,
    );

    return chartDataModel;
  }
}
