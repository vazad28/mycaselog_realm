part of 'support_data_repository_impl.dart';

abstract class SupportDataRepository {
  /// get settings support data
  //Result<SupportDataModel, RepositoryFailure>
  Result<SupportDataModel, RepositoryFailure> getSupportData();

  /// update settings support data
  Future<Result<SupportDataModel, RepositoryFailure>> setSupportData(
    SupportDataModel supportDataModel,
  );

  // Future<Result<List<AssistantModel>, RepositoryFailure>> updateSurgeryAssistants(
  //   List<AssistantModel> surgeryAssistants,
  // );

  /// get assistants
  // Future<Result<List<AssistantModel>, RepositoryFailure>> getAssistants();

  // /// get surgery locations
  // Future<Result<List<SurgeryLocationModel>, RepositoryFailure>>
  //     getSurgeryLocations();
}
