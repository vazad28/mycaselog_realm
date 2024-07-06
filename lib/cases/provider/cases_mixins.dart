part of 'cases_provider.dart';

mixin CasesEventMixin {
  void updateCaseTileStyle(WidgetRef ref, int toggleValue) {
    ref.watch(caseTileStyleProvider.notifier).update(toggleValue);
  }

  Future<List<CaseModel>> onSearchCases(WidgetRef ref, String searchTerm) => ref
      .read(ftsSearchRepositoryProvider)
      .searchCaseMedia<CaseModel>(searchTerm);

  Future<void> pullDownToRefresh(WidgetRef ref) =>
      ref.watch(casesNotifierProvider.notifier).pullToRefresh();
}

mixin CasesStateMixin {
  AsyncValue<int> watchTotalCasesCount(WidgetRef ref) =>
      ref.watch(totalCasesCountProvider);

  int watchCaseTileStyle(WidgetRef ref) => ref.watch(caseTileStyleProvider);
}
