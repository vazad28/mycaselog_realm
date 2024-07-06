import 'package:app_models/app_models.dart';
import 'package:async_result/async_result.dart';

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
  ) {
    // TODO: implement addTemplate
    throw UnimplementedError();
  }

  @override
  Future<Result<List<SharedTemplateModel>, RepositoryFailure>>
      getAllSharedTemplates(String speciality) {
    // TODO: implement getAllSharedTemplates
    throw UnimplementedError();
  }

  @override
  Future<List<TemplateModel>> getAllTemplates() {
    return Future.sync(() {
      return _databaseService.templatesCollection.getAllTemplates();
    });
  }

  @override
  Future<TemplateModel?> getTemplate(String? templateID) {
    return Future.sync(() {
      if (templateID == null) return null;

      return _databaseService.templatesCollection.getTemplate(templateID);
    });
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
  int getTotalTemplatesCount() {
    // TODO: implement getTotalTemplatesCount
    throw UnimplementedError();
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
