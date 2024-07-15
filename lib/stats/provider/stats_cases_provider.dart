import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:collection/collection.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

import '../../core/failures/app_failures.dart';
import '../stats.dart';

part '../../generated/stats/provider/stats_cases_provider.g.dart';

/// Provider for holding the scroll controller double value
// @riverpod
// class StatsCasesScrollPosition extends _$StatsCasesScrollPosition {
//   @override
//   double build() => 0;

//   // ignore: use_setters_to_change_properties
//   void update(double position) => state = position;
// }

@riverpod
class StatsCases extends _$StatsCases {
  @override
  StateOf<List<CaseModel>> build() {
    /// Watch for currently selected index of the chart
    final touchedIndex = ref.watch(touchedIndexProvider);

    /// watch change in the state of the chart data
    final chartDataModelState = ref.watch(statsDataProvider);

    if (chartDataModelState.isFailure) {
      return StateOf<List<CaseModel>>.failure(chartDataModelState.failure);
    }

    /// get list of caseIDs from the ChartDataModel
    final caseListIDs = chartDataModelState.data?.data.map((e) => e.data);

    /// Load new list
    _getStatsCases(caseListIDs, touchedIndex);

    return const StateOf<List<CaseModel>>.loading();
  }

  Future<void> _getStatsCases(
    Iterable<Iterable<String>>? caseListIDs,
    int? touchedIndex,
  ) async {
    if (caseListIDs?.isEmpty ?? true) {
      state = StateOf<List<CaseModel>>.failure(
        AppFailure.generic(S.current.noCases),
      );
      return;
    }

    ///If we have touched Index non null we fetch only the touched Index data
    ///point cases else we fetch all ids
    var caseIDsToFetch = <String>[];

    if (touchedIndex == null) {
      caseIDsToFetch = caseListIDs!.flattened.toList();
    } else {
      caseIDsToFetch = caseListIDs!.elementAt(touchedIndex).toList();
    }

    try {
      final models = await ref
          .watch(statsRepositoryProvider)
          .getStatsCases(caseIDsToFetch);
      state = StateOf<List<CaseModel>>.success(models);
    } catch (err) {
      state = StateOf<List<CaseModel>>.failure(err.toAppFailure());
    }
  }
}
