//import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

import '../../../app_models.dart';

//part 'support_data_realm.g.dart';
part 'support_data_realm.realm.dart';

@RealmModel()
class _SupportDataRealm {
  @PrimaryKey()
  late String userID;
  late List<_AssistantRealm> assistants = [];
  late List<String> activeBasicFields = [];
  late List<String> anesthesiaBlocks = [];
  late List<_SurgeryLocationRealm> surgeryLocations = [];
  late int timestamp = 0;

  SupportDataModel toModel() {
    return SupportDataModel(
      userID: userID,
      assistants: assistants.map((e) => e.toModel()).toList(),
      activeBasicFields: activeBasicFields,
      anesthesiaBlocks: anesthesiaBlocks,
      surgeryLocations: surgeryLocations.map((e) => e.toModel()).toList(),
      timestamp: timestamp,
    );
  }
}

extension SupportDataRealmX on SupportDataRealm {
  static SupportDataRealm zero(String userID) => SupportDataRealm(userID);

  static SupportDataRealm fromModel(SupportDataModel model) {
    return SupportDataRealm(
      model.userID,
      assistants: model.assistants.map(AssistantRealmX.fromModel).toList(),
      activeBasicFields: model.activeBasicFields,
      anesthesiaBlocks: model.anesthesiaBlocks,
      surgeryLocations:
          model.surgeryLocations.map(SurgeryLocationRealmX.fromModel).toList(),
      timestamp: model.timestamp,
    );
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Assistant Model
/// ////////////////////////////////////////////////////////////////////

@RealmModel()
//@JsonSerializable(explicitToJson: true)
class _AssistantRealm {
  @PrimaryKey()
  late String assistantID;
  late String? name;
  late String? phone;
  late String? photoUrl;
  late int removed = 0;
  late int createdAt = 0;
  late int timestamp = 0;

  AssistantModel toModel() {
    return AssistantModel(
      assistantID: assistantID,
      name: name,
      phone: phone,
      photoUrl: photoUrl,
      removed: removed,
      createdAt: createdAt,
      timestamp: timestamp,
    );
  }
}

extension AssistantRealmX on AssistantRealm {
  // static AssistantRealm fromJson(Map<String, dynamic> json) =>
  //     _$AssistantRealmFromJson(json).toRealmObject();

  // Map<String, dynamic> toJson() => _$AssistantRealmToJson(this);

  static AssistantRealm fromModel(AssistantModel model) {
    return AssistantRealm(
      model.assistantID,
      name: model.name,
      phone: model.phone,
      photoUrl: model.photoUrl,
      removed: model.removed,
      createdAt: model.createdAt,
      timestamp: model.timestamp,
    );
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Surgery Location Model
/// ////////////////////////////////////////////////////////////////////
@RealmModel()
//@JsonSerializable(explicitToJson: true)
class _SurgeryLocationRealm {
  @PrimaryKey()
  late String locationID;
  late String? name;
  late String? phone;
  late String? address;
  late int removed = 0;
  late int createdAt = 0;
  late int timestamp = 0;

  SurgeryLocationModel toModel() {
    return SurgeryLocationModel(
      locationID: locationID,
      name: name,
      phone: phone,
      address: address,
      removed: removed,
      createdAt: createdAt,
      timestamp: timestamp,
    );
  }
}

extension SurgeryLocationRealmX on SurgeryLocationRealm {
  // static SurgeryLocationRealm fromJson(Map<String, dynamic> json) =>
  //     _$SurgeryLocationRealmFromJson(json).toRealmObject();

  // Map<String, dynamic> toJson() => _$SurgeryLocationRealmToJson(this);

  static SurgeryLocationRealm fromModel(SurgeryLocationModel model) {
    return SurgeryLocationRealm(
      model.locationID,
      name: model.name,
      phone: model.phone,
      address: model.address,
      removed: model.removed,
      createdAt: model.createdAt,
      timestamp: model.timestamp,
    );
  }
}
