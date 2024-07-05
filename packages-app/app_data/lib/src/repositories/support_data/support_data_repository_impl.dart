import 'package:app_models/app_models.dart';
import 'package:async_result/async_result.dart';
import 'package:logger_client/logger_client.dart';

import '../../../../app_data.dart';

part 'support_data_repository.dart';

class SupportDataRepositoryImpl extends SupportDataRepository with LoggerMixin {
  SupportDataRepositoryImpl({
    required AppData appData,
  }) : _appData = appData;

  final AppData _appData;

  // @override
  // Future<Result<SupportDataModel, RepositoryFailure>> getSupportData() async {
  //   try {
  //     final data = await _appData.databaseService.supportDataCollection
  //             .getSupportData() ??
  //         SupportDataModel(_appData.currentUser.id);
  //     return Result<SupportDataModel, RepositoryFailure>.success(data);
  //   } catch (err, st) {
  //     logger.severe(err, st);
  //     return Result.failure(RepositoryFailure.fromError(err));
  //   }
  // }

  // @override
  // Future<Result<SupportDataModel, RepositoryFailure>> updateSupportData(
  //   SupportDataModel supportDataModel,
  // ) async {
  //   try {
  //     final updatedSupportDataModel =
  //         supportDataModel.copyWith(timestamp: ModelUtils.getTimestamp);

  //     await _appData.local.supportDataCollection.put(updatedSupportDataModel);

  //     ///update server and on error save the request in pending collection
  //     await _appData.remote.supportDataCollection.updatedSupportDataModel(
  //       updatedSupportDataModel,
  //     );

  //     return Result.success(supportDataModel);
  //   } catch (err) {
  //     logger.severe(err);
  //     return Result.failure(RepositoryFailure.fromError(err));
  //   }
  // }
}
