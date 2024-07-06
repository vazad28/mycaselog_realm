part of 'stats_repository_impl.dart';

abstract class StatsRepository {
  /// get stats data based on chart req model
  Future<Result<ChartReqModel, RepositoryFailure>> getStatistics(
    ChartReqModel chartReqModel,
  );

  /// get range of years for timer based on from when to when cases are recorded
  Future<List<int>?> getYearList();

  ///Get Stats cases based on caseID list
  Future<List<CaseModel>> getStatsCases(List<String> idList);

  /// Get stats for the user
  Future<Result<UserStatsModel, RepositoryFailure>> getUserStats();
}
