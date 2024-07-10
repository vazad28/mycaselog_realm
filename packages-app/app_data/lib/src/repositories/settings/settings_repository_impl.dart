// import 'dart:async';

// import 'package:app_models/app_models.dart';
// import 'package:async_result/async_result.dart';
// import 'package:logger_client/logger_client.dart';

// import '../../../../app_data.dart';

// part 'settings_repository.dart';

// class SettingsRepositoryImpl extends SettingsRepository with LoggerMixin {
//   SettingsRepositoryImpl({
//     required DatabaseService databaseService,
//   }) : _databaseService = databaseService;

//   final DatabaseService _databaseService;

//   @override
//   SettingsModel getAppSettings() {
//     final settingsModel =
//         _databaseService.settingsCollection.getSingle(_databaseService.userID);
//     return settingsModel ?? SettingsModel.zero(_databaseService.userID);
//   }

//   @override
//   Future<Result<SettingsModel, RepositoryFailure>> setAppSettings(
//     SettingsModel settingsModel,
//   ) async {
//     try {
//       final model = settingsModel.copyWith(timestamp: ModelUtils.getTimestamp);
//       await _databaseService.settingsCollection
//           .put(_databaseService.userID, model);

//       return Result.success(model);
//     } catch (err, st) {
//       logger.severe(err, st);
//       return Result.failure(RepositoryFailure.fromError(err));
//     }
//   }
// }
