import 'package:app_models/app_models.dart';
import 'package:async_result/async_result.dart';
import 'package:logger_client/logger_client.dart';
import 'package:realm/realm.dart';

import '../../../../app_data.dart';

part 'support_data_repository.dart';

class SupportDataRepositoryImpl extends SupportDataRepository with LoggerMixin {
  SupportDataRepositoryImpl({
    required DatabaseService databaseService,
  }) : _databaseService = databaseService;

  final DatabaseService _databaseService;

  @override
  Result<SupportDataModel, RepositoryFailure> getSupportData() {
    try {
      final data = _databaseService.supportDataCollection.getSupportData();

      return Result.success(data);
    } catch (err, st) {
      logger.severe(err, st);
      return Result.failure(RepositoryFailure.fromError(err));
    }
  }

  @override
  Future<Result<SupportDataModel, RepositoryFailure>> setSupportData(
    SupportDataModel supportDataModel,
  ) async {
    try {
      final model =
          await _databaseService.supportDataCollection.upsert(supportDataModel);

      return Result.success(model);
    } catch (err) {
      logger.severe(err);
      return Result.failure(RepositoryFailure.fromError(err));
    }
  }
}
