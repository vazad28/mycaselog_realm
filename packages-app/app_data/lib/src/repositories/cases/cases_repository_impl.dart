import 'package:app_models/app_models.dart';
import 'package:async_result/async_result.dart';

import '../../../app_data.dart';

part './cases_repository.dart';

class CasesRepositoryImpl extends CasesRepository {
  CasesRepositoryImpl({required this.appData});

  final AppData appData;

  @override
  Future<Result<CaseModel, RepositoryFailure>> addCase(
      CaseModel caseModel) async {
    try {
      await appData.databaseService.casesCollection
          .put(caseModel.caseID, caseModel);
      return Result.success(caseModel);
    } catch (err) {
      return Result.failure(RepositoryFailure.fromError(err));
    }
  }
}
