import 'dart:async';

import 'package:app_models/app_models.dart';
import 'package:async_result/async_result.dart';
import 'package:realm_dart/src/results.dart';

import '../../../app_data.dart';

part './cases_repository.dart';

class CasesRepositoryImpl extends CasesRepository {
  ///  constructor
  CasesRepositoryImpl({
    required DatabaseService databaseService,
  }) : _databaseService = databaseService;

  final DatabaseService _databaseService;

  @override
  Future<Result<CaseModel, RepositoryFailure>> addCase(
    CaseModel caseModel,
  ) async {
    try {
      await _databaseService.casesCollection.upsert(caseModel);
      return Result.success(caseModel);
    } catch (err) {
      return Result.failure(RepositoryFailure.fromError(err));
    }
  }

  @override
  FutureOr<int> getTotalCaseCount() async {
    return Future.sync(
      () => _databaseService.casesCollection.countAll(),
    );
  }

  @override
  RealmResults<CaseModel> loadCases() {
    return _databaseService.casesCollection.loadCases();
  }
}
