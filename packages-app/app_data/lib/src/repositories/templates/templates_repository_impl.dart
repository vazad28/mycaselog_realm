import 'package:app_models/app_models.dart';
import 'package:async_result/async_result.dart';
import 'package:realm/realm.dart';

import '../../../app_data.dart';

part 'templates_repository.dart';

class TemplatesRepositoryImpl implements TemplatesRepository {
  ///  constructor
  TemplatesRepositoryImpl({
    required DatabaseService databaseService,
  }) : _databaseService = databaseService;

  final DatabaseService _databaseService;

  @override
  Future<Result<Unit, RepositoryFailure>> addSharedTemplate(
    SharedTemplateModel sharedTemplateModel,
  ) {
    // TODO: implement addSharedTemplate
    throw UnimplementedError();
  }

  @override
  Future<Result<TemplateModel, RepositoryFailure>> addTemplate(
    TemplateModel templateModel,
  ) async {
    try {
      final model = templateModel..timestamp = ModelUtils.getTimestamp;
      await _databaseService.templatesCollection
          .put(templateModel.templateID, model);
      return Result.success(model);
    } catch (err) {
      return Result.failure(RepositoryFailure.fromError(err));
    }
  }

  @override
  Future<Result<List<SharedTemplateModel>, RepositoryFailure>>
      getAllSharedTemplates(String speciality) {
    // TODO: implement getAllSharedTemplates
    throw UnimplementedError();
  }

  @override
  Future<List<TemplateModel>> getAllTemplates() async {
    return _databaseService.templatesCollection.getAllTemplates();
  }

  @override
  Future<TemplateModel?> getTemplate(String? templateID) async {
    if (templateID == null) return null;

    final template =
        _databaseService.templatesCollection.getTemplate(templateID);
    print(template?.toJson());
    return template;
  }

  @override
  Future<TemplateFieldModel?> getTemplateField(
    String templateID,
    String templateFieldID,
  ) {
    // TODO: implement getTemplateField
    throw UnimplementedError();
  }

  @override
  Stream<RealmResultsChanges<TemplateModel>> getTotalTemplatesCount() {
    return _databaseService.templatesCollection.templateCount();
  }

  @override
  Future<Result<Unit, RepositoryFailure>> updateSharedTemplateUsedCount(
    SharedTemplateModel sharedTemplateModel,
    int factor,
  ) {
    // TODO: implement updateSharedTemplateUsedCount
    throw UnimplementedError();
  }

  @override
  Future<Result<TemplateModel, RepositoryFailure>> updateTemplate(
    TemplateModel templateModel,
  ) {
    // TODO: implement updateTemplate
    throw UnimplementedError();
  }
}
