part of 'templates_repository_impl.dart';

abstract class TemplatesRepository {
  // Get list of dummy case models for testing
  Future<List<TemplateModel>> getAllTemplates();

  // Get total case count for enless list view
  Stream<RealmResultsChanges<TemplateModel>> getTotalTemplatesCount();

  // Get  single caseModel by caseID
  Future<TemplateModel?> getTemplate(String? templateID);

  Future<TemplateFieldModel?> getTemplateField(
    String templateID,
    String templateFieldID,
  );

  // Add a new case
  Future<Result<TemplateModel, RepositoryFailure>> addTemplate(
    TemplateModel templateModel,
  );

  /// count of cases using a template
  //Future<int> getCasesCountByTemplateID(String templateID);

  // Get list of shared templates
  Future<Result<List<SharedTemplateModel>, RepositoryFailure>>
      getAllSharedTemplates(String speciality);

  /// add shared template to server
  Future<Result<Unit, RepositoryFailure>> addSharedTemplate(
    SharedTemplateModel sharedTemplateModel,
  );

  Future<Result<Unit, RepositoryFailure>> updateSharedTemplateUsedCount(
    SharedTemplateModel sharedTemplateModel,
    int factor,
  );

  Future<Result<TemplateModel, RepositoryFailure>> updateTemplate(
    TemplateModel templateModel,
  );
}
