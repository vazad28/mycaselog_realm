import 'dart:math' as math show ln10, log, max, min, pow;

import 'package:app_data/app_data.dart';
import 'package:app_extensions/app_extensions.dart';
import 'package:app_models/app_models.dart';
import 'package:async_result/async_result.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/failures/app_failures.dart';
import '../../core/providers/providers.dart';

part '../../generated/stats/provider/stats_repository.g.dart';

// ignore: constant_identifier_names
enum MonthsList { Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec }

/// Stats repository class provider
@riverpod
StatsRepository statsRepository(StatsRepositoryRef ref) {
  return StatsRepository(ref);
}

class StatsRepository {
  StatsRepository(this.ref);

  final StatsRepositoryRef ref;

  CasesCollection get _casesCollection => ref.watch(dbProvider).casesCollection;

  ///get full text search result ids
  Iterable<String> _getSearchIds(String searchTermProcessed) {
    final searchRes =
        ref.watch(dbProvider).casesCollection.search(searchTermProcessed);
    // list of case IDs matching the search term
    return searchRes.map((e) => e.caseID);
  }

  Iterable<String> _getSearchIdsForClause(String searchTermProcessed) {
    final splits = searchTermProcessed.split('|');
    if (splits.isEmpty) return [];

    final standAlone = splits.first.isNotEmpty ? splits[0].split(',') : null;
    final orList = splits.length > 1 ? splits[1].split(',') : null;
    final andList = splits.length > 2 ? splits[2].split(',') : null;

    return _searchComplexQuery(
      standAlone: standAlone,
      orList: orList,
      andList: andList,
    );
  }

  /// Fetch statistics
  Future<Result<ChartReqModel, Exception>> getStatistics(
    ChartReqModel chartReqModel,
  ) async {
    final fromStamp = chartReqModel.fromStamp?.millisecondsSinceEpoch ?? 0;
    final toStamp = chartReqModel.toStamp?.millisecondsSinceEpoch ?? 0;

    assert(toStamp > fromStamp, 'FromTime can not be less than ToTime');

    // if we have search term or filter term (just processed search term)
    //final searchTerm = chartReqModel.filterClause ?? chartReqModel.searchTerm;
    Iterable<String>? idList;

    if (chartReqModel.searchTerm != null) {
      //print('searching stats by searchTerm');
      idList = _getSearchIds(chartReqModel.searchTerm!);
      if (idList.isEmpty) {
        return Result.failure(const AppFailure.noStatsData());
      }
    } else if (chartReqModel.filterClause != null) {
      //print('searching stats by filter clause');
      idList = _getSearchIdsForClause(chartReqModel.filterClause!);
      //print(idList);
      if (idList.isEmpty) {
        return Result.failure(const AppFailure.noStatsData());
      }
    }

    final caseModels = _casesCollection.casesBetweenTimestamp(
      fromTimestamp: fromStamp,
      toTimestamp: toStamp,
      idList: idList,
    );

    /// important to throw failure here else there is lot of null
    /// checks and other errors
    if (caseModels.isEmpty) {
      return Result.failure(const AppFailure.noStatsData());
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

  Future<List<CaseModel>> getStatsCases(List<String> idList) async {
    final caseModels = _casesCollection.getAllByCaseIDs(idList);
    return caseModels.nonNulls.toList();
  }

  /// List of years to select in plotting graph
  List<int>? getYearList() {
    final earliestSurgeryTimestamp = _casesCollection.firstCaseYear();

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
    RealmResults<CaseModel> data,
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

  ///  Do complex search query on the stats Query  Phrases
  Iterable<String> _searchComplexQuery({
    List<String>? standAlone,
    List<String>? orList,
    List<String>? andList,
  }) {
    // Construct the query string
    var query = '';

    if (standAlone != null) {
      query = standAlone
          .map((procedure) => 'surgery CONTAINS[c] "$procedure"')
          .join(' OR ');
    }

    if (orList != null && andList != null) {
      final appendOrQuery = orList
          .map((procedure) => 'surgery CONTAINS[c] "$procedure"')
          .join(' OR ');

      final appendAndQuery = andList
          .map((procedure) => 'surgery CONTAINS[c] "$procedure"')
          .join(' OR ');

      query = query.isNotEmpty
          ? '($query) OR (($appendOrQuery) AND ($appendAndQuery))'
          : '($appendOrQuery) AND ($appendAndQuery)';
    }

    // Complete query string with additional conditions
    query = '($query) AND removed == 0 SORT(timestamp DESC)';

    //print(query.toString());

    // Execute the query
    final results = ref.watch(dbProvider).casesCollection.searchQuery(query);

    return results.map((e) => e.caseID).toList();
  }
}
