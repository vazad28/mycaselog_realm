import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

import '../model_utils.dart';

part 'support_data_model.realm.dart';
part 'support_data_model.g.dart';

enum SupportDataProps {
  assistants,
  locations,
  surgeryLocations,
  pcps,
  associates,
  mentors,
  activeBasicFields,
  anesthesiaBlocks,
  settings
}

@RealmModel()
@JsonSerializable(explicitToJson: true)
class _SupportDataModel {
  @PrimaryKey()
  late String userID;
  late List<_AssistantModel> assistants = [];
  late List<String> activeBasicFields = [];
  late List<String> anesthesiaBlocks = [];
  late List<_SurgeryLocationModel> surgeryLocations = [];
  late int timestamp = 0;

  SupportDataModel toRealmObject() {
    return SupportDataModel(
      userID,
      assistants: assistants.map((e) => AssistantModel._fromEJson(e.toEJson())),
      //X.fromJson(e.toJson())).toList(),
      activeBasicFields: activeBasicFields,
      anesthesiaBlocks: anesthesiaBlocks,
      surgeryLocations: surgeryLocations
          .map((e) => SurgeryLocationModel._fromEJson(e.toEJson()))
          .toList(),
      timestamp: timestamp,
    );
  }

  Map<String, dynamic> toJson() => _$SupportDataModelToJson(this);
}

extension SupportDataModelX on SupportDataModel {
  static SupportDataModel zero(String userID) {
    final timestamp = ModelUtils.getTimestamp;

    final supportDataModel = SupportDataModel(
      userID,
      timestamp: timestamp,
    );

    return supportDataModel;
  }

  static SupportDataModel fromJson(Map<String, dynamic> json) =>
      _$SupportDataModelFromJson(json).toRealmObject();
}

/// ////////////////////////////////////////////////////////////////////
/// Assistant Model
/// ////////////////////////////////////////////////////////////////////
enum AssistantModelProps {
  assistantID,
  name,
  phone,
  photoUrl,
  removed,
  createdAt,
  timestamp
}

/// Assistants embedded in to support data

@RealmModel()
@JsonSerializable(explicitToJson: true)
class _AssistantModel {
  @PrimaryKey()
  late String assistantID;
  late String? name;
  late String? phone;
  late String? photoUrl;
  late int? removed = 0;
  late int? createdAt = 0;
  late int? timestamp = 0;

  static AssistantModel fromJson(Map<String, dynamic> json) =>
      AssistantModelX.fromJson(json);

  Map<String, dynamic> toJson() => _$AssistantModelToJson(this);

  AssistantModel toRealmObject() {
    return AssistantModel(
      assistantID,
      name: name,
      phone: phone,
      photoUrl: photoUrl,
      removed: removed,
      createdAt: timestamp,
      timestamp: timestamp,
    );
  }
}

extension AssistantModelX on AssistantModel {
  static AssistantModel zero() {
    final timestamp = ModelUtils.getTimestamp;
    final assistantModel = AssistantModel(
      ModelUtils.uniqueID,
      createdAt: timestamp,
      timestamp: timestamp,
    );

    return assistantModel;
  }

  static AssistantModel fromJson(Map<String, dynamic> json) =>
      _$AssistantModelFromJson(json).toRealmObject();

  //Map<String, dynamic> toJson() => _$AssistantModelToJson(this);
}

/// ////////////////////////////////////////////////////////////////////
/// Surgery Location Model
/// ////////////////////////////////////////////////////////////////////
enum SurgeryLocationProps {
  locationID,
  name,
  address,
  phone,
  removed,
  createdAt,
  timestamp
}

/// Surgery  locations embedded into support data
@RealmModel()
@JsonSerializable(explicitToJson: true)
class _SurgeryLocationModel {
  @PrimaryKey()
  late String locationID;
  late String? name;
  late String? phone;
  late String? address;
  late int? removed = 0;
  late int? createdAt = 0;
  late int? timestamp = 0;

  static SurgeryLocationModel fromJson(Map<String, dynamic> json) =>
      SurgeryLocationModelX.fromJson(json);

  Map<String, dynamic> toJson() => _$SurgeryLocationModelToJson(this);

  SurgeryLocationModel toRealmObject() {
    return SurgeryLocationModel(
      locationID,
      name: name,
      phone: phone,
      address: address,
      removed: removed,
      createdAt: timestamp,
      timestamp: timestamp,
    );
  }
}

extension SurgeryLocationModelX on SurgeryLocationModel {
  static SurgeryLocationModel zero() {
    final timestamp = ModelUtils.getTimestamp;
    final surgeryLocationModel = SurgeryLocationModel(
      ModelUtils.uniqueID,
      createdAt: timestamp,
      timestamp: timestamp,
    );

    return surgeryLocationModel;
  }

  static SurgeryLocationModel fromJson(Map<String, dynamic> json) =>
      _$SurgeryLocationModelFromJson(json).toRealmObject();

  //Map<String, dynamic> toJson() => _$SurgeryLocationModelToJson(this);
}
