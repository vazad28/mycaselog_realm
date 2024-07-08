// import 'package:copy_with_extension/copy_with_extension.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'package:realm/realm.dart';

// import '../model_utils.dart';

// part 'support_data_model.realm.dart';
// part 'support_data_model.g.dart';

// enum SupportDataProps {
//   assistants,
//   locations,
//   surgeryLocations,
//   pcps,
//   associates,
//   mentors,
//   activeBasicFields,
//   anesthesiaBlocks,
//   settings
// }

// @CopyWith()
// @JsonSerializable(explicitToJson: true)
// class _SupportDataModel {
//   @PrimaryKey()
//   late String userID;
//   late List<_AssistantModel> assistants = [];
//   //late List<PcpModel> pcps = [];
//   late List<String> activeBasicFields = [];
//   late List<String> anesthesiaBlocks = [];
//   late List<_SurgeryLocationModel> surgeryLocations = [];
//   late int? timestamp;
//   late bool? synced = false;
// }

// extension SupportDataModelX on SupportDataModel {
//   static SupportDataModel _toRealmObject(_SupportDataModel supportDataModel) {
//     return SupportDataModel(
//       supportDataModel.userID,
//       timestamp: supportDataModel.timestamp,
//     );
//   }

//   static SupportDataModel zero(String userID) {
//     final timestamp = ModelUtils.getTimestamp;

//     final supportDataModel = SupportDataModel(
//       userID,
//       timestamp: timestamp,
//     );

//     return supportDataModel;
//   }

//   static SupportDataModel fromJson(Map<String, dynamic> json) =>
//       _toRealmObject(_$SupportDataModelFromJson(json));

//   Map<String, dynamic> toJson() => _$SupportDataModelToJson(this);
// }

// /// ////////////////////////////////////////////////////////////////////
// /// Assistant Model
// /// ////////////////////////////////////////////////////////////////////
// enum AssistantModelProps {
//   assistantID,
//   name,
//   phone,
//   photoUrl,
//   removed,
//   createdAt,
//   timestamp
// }

// /// Assistants embedded in to support data

// @RealmModel()
// @JsonSerializable(explicitToJson: true)
// class _AssistantModel {
//   @PrimaryKey()
//   late String assistantID;
//   late String? name;
//   late String? phone;
//   late String? photoUrl;
//   late int? removed = 0;
//   late int? createdAt = 0;
//   late int? timestamp = 0;

//   static AssistantModel fromJson(Map<String, dynamic> json) =>
//       AssistantModelX.fromJson(json);

//   Map<String, dynamic> toJson() => _$AssistantModelToJson(this);
// }

// extension AssistantModelX on AssistantModel {
//   static AssistantModel _toRealmObject(_AssistantModel assistantModel) {
//     return AssistantModel(
//       assistantModel.assistantID,
//       createdAt: assistantModel.timestamp,
//       timestamp: assistantModel.timestamp,
//     );
//   }

//   static AssistantModel zero() {
//     final timestamp = ModelUtils.getTimestamp;
//     final assistantModel = AssistantModel(
//       ModelUtils.uniqueID,
//       createdAt: timestamp,
//       timestamp: timestamp,
//     );

//     return assistantModel;
//   }

//   static AssistantModel fromJson(Map<String, dynamic> json) =>
//       _toRealmObject(_$AssistantModelFromJson(json));

//   Map<String, dynamic> toJson() => _$AssistantModelToJson(this);
// }

// /// ////////////////////////////////////////////////////////////////////
// /// Surgery Location Model
// /// ////////////////////////////////////////////////////////////////////
// enum SurgeryLocationProps {
//   locationID,
//   name,
//   address,
//   phone,
//   removed,
//   createdAt,
//   timestamp
// }

// /// Surgery  locations embedded into support data
// @RealmModel()
// @JsonSerializable(explicitToJson: true)
// class _SurgeryLocationModel {
//   @PrimaryKey()
//   late String locationID;
//   late String? name;
//   late String? phone;
//   late String? address;
//   late int? removed = 0;
//   late int? createdAt = 0;
//   late int? timestamp = 0;

//   static SurgeryLocationModel fromJson(Map<String, dynamic> json) =>
//       SurgeryLocationModelX.fromJson(json);

//   Map<String, dynamic> toJson() => _$SurgeryLocationModelToJson(this);
// }

// extension SurgeryLocationModelX on SurgeryLocationModel {
//   static SurgeryLocationModel _toRealmObject(
//       _SurgeryLocationModel assistantModel) {
//     return SurgeryLocationModel(
//       assistantModel.locationID,
//       createdAt: assistantModel.timestamp,
//       timestamp: assistantModel.timestamp,
//     );
//   }

//   static SurgeryLocationModel zero() {
//     final timestamp = ModelUtils.getTimestamp;
//     final surgeryLocationModel = SurgeryLocationModel(
//       ModelUtils.uniqueID,
//       createdAt: timestamp,
//       timestamp: timestamp,
//     );

//     return surgeryLocationModel;
//   }

//   static SurgeryLocationModel fromJson(Map<String, dynamic> json) =>
//       _toRealmObject(_$SurgeryLocationModelFromJson(json));

//   Map<String, dynamic> toJson() => _$SurgeryLocationModelToJson(this);
// }
