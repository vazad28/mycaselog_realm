part of './cases_repository_impl.dart';

abstract class CasesRepository {
  // Add a new case
  Future<Result<CaseModel, RepositoryFailure>> addCase(
    CaseModel caseModel,
  );
}
