import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

import '../stats.dart';

part '../../generated/stats/provider/stats_providers.g.dart';

/// Page controller provider
@riverpod
PageController chartTabsController(ChartTabsControllerRef ref) {
  return PageController();
}

/// Provider holding current touched chart items index
@riverpod
class TouchedIndex extends _$TouchedIndex {
  @override
  int? build() => null;

  // ignore: use_setters_to_change_properties
  void update(int? index) => state = index;
}

@riverpod
class StatsData extends _$StatsData {
  @override
  StateOf<ChartDataModel> build() {
    final chartReqModel = ref.watch(statsNotifierProvider);
    _getChartData(chartReqModel);
    return const StateOf<ChartDataModel>.loading();
  }

  Future<void> _getChartData(ChartReqModel chartReqModel) async {
    final result =
        await ref.watch(statsRepositoryProvider).getStatistics(chartReqModel);

    result.when(
      failure: (f) {
        state = StateOf<ChartDataModel>.failure(f);
      },
      success: (r) {
        state = StateOf<ChartDataModel>.success(r.chartData!);
      },
    );
  }
}

@riverpod
class StatsNotifier extends _$StatsNotifier with LoggerMixin {
  DateTime? firstYearTimestamp;
  final _searchController = SearchController();

  SearchController get searchController => _searchController;

  @override
  ChartReqModel build() {
    final now = DateTime.now();
    final firstDayDateTime = DateTime(now.year, now.month);
    final lastDayDateTime = (now.month < 12)
        ? DateTime(now.year, now.month + 1)
        : DateTime(now.year + 1, 1, 0);

    return ChartReqModel(
      toStamp: lastDayDateTime,
      fromStamp: firstDayDateTime,
      currMonth: now.month,
      currYear: now.year,
    );
  }

  /// on search term update call state reset
  void updateSearchTerm(String suggestion) {
    state = state.copyWith(searchTerm: suggestion);
  }

  void searchStats({String? searchTerm, String? filterClause}) {
    state = state.copyWith(
        searchTerm: searchTerm,
        filterClause: filterClause,
        currMonth: state.currMonth,);
  }

  /// Method to run stats on chnage of year from UI
  void onYearSelect(int year) {
    //if we have no month selected, we are not doing anything to year on tap if
    // its the same year
    final chartReqModel = state.copyWith(
      currYear: (state.currYear == year) ? null : year,
    );

    if (chartReqModel.currYear == null) {
      if (firstYearTimestamp == null) return;
      ref.read(touchedIndexProvider.notifier).update(null);
      _chartReqModelForAllYears();
      return;
    }

    chartReqModel.currMonth == null
        ? _chartReqModelForYear(year, null) //<-  Load for year
        : _chartReqModelForMonth(year, chartReqModel.currMonth);
  }

  /// Method to call stats for month selection
  void onMonthSelect(int index) {
    final currMonth = (state.currMonth == index + 1) ? null : index + 1;

    ref.read(touchedIndexProvider.notifier).state = null;

    currMonth == null
        ? _chartReqModelForYear(
            state.currYear ?? DateTime.now().year,
            null,
          )
        : _chartReqModelForMonth(
            state.currYear ?? DateTime.now().year,
            currMonth,
          );
  }

  /// ////////////////////////////////////////////////////////////////////
  /// Local methods
  /// ////////////////////////////////////////////////////////////////////
  /// Return the new chart req upon month change
  void _chartReqModelForMonth(
    int year,
    int? month,
  ) {
    /// if we have month not null we check if this is december
    if (month != null) {
      final monthToDateTimeMonth = month < 12 ? month + 1 : 13;
      state = state.copyWith(
        currYear: year,
        currMonth: month,
        groupByLabel: StatsGroupBy.day,
        fromStamp: DateTime(year, month),
        toStamp: DateTime(year, monthToDateTimeMonth),
      );
    } else {
      state = state.copyWith(
        groupByLabel: StatsGroupBy.month,
        currMonth: month,
        currYear: year,
      );
    }
  }

  /// object for running the stas for all years
  void _chartReqModelForAllYears() {
    state = ChartReqModel(
      fromStamp: firstYearTimestamp,
      toStamp: DateTime.now(),
      groupByLabel: StatsGroupBy.year,
    );
  }

  /// Chart req for any given year
  void _chartReqModelForYear(int year, int? month) {
    state = state.copyWith(
      fromStamp: DateTime(year),
      toStamp: DateTime(year, 13, 0),
      groupByLabel: StatsGroupBy.month,
      currYear: year,
      currMonth: month,
    );
  }
}
