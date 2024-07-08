import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../app_models.dart';

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

@CopyWith()
@JsonSerializable(explicitToJson: true)
class SupportDataModel {
  SupportDataModel({
    required this.userID,
    this.assistants = const [],
    this.activeBasicFields = const [],
    this.anesthesiaBlocks = const [],
    this.surgeryLocations = const [],
    this.timestamp = 0,
  });

  factory SupportDataModel.fromJson(Map<String, dynamic> json) {
    return _$SupportDataModelFromJson(json);
  }

  final List<String> activeBasicFields;
  final List<String> anesthesiaBlocks;
  final List<AssistantModel> assistants;
  final List<SurgeryLocationModel> surgeryLocations;
  final int timestamp;
  final String userID;

  Map<String, dynamic> toJson() => _$SupportDataModelToJson(this);
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
@CopyWith()
@JsonSerializable(explicitToJson: true)
class AssistantModel {
  const AssistantModel({
    required this.assistantID,
    this.name,
    this.phone,
    this.photoUrl,
    this.removed = 0,
    this.createdAt = 0,
    this.timestamp = 0,
  });

  factory AssistantModel.fromJson(Map<String, dynamic> json) =>
      _$AssistantModelFromJson(json);

  factory AssistantModel.zero() {
    final timestamp = ModelUtils.getTimestamp;
    return AssistantModel(
      assistantID: ModelUtils.uniqueID,
      timestamp: timestamp,
      createdAt: timestamp,
    );
  }

  final String assistantID;
  final int createdAt;
  final String? name;
  final String? phone;
  final String? photoUrl;
  final int removed;
  final int timestamp;

  @override
  Map<String, dynamic> toJson() => _$AssistantModelToJson(this);
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
@CopyWith()
@JsonSerializable()
class SurgeryLocationModel {
  SurgeryLocationModel({
    required this.locationID,
    this.name,
    this.phone,
    this.address,
    this.removed = 0,
    this.createdAt = 0,
    this.timestamp = 0,
  });

  factory SurgeryLocationModel.fromJson(Map<String, dynamic> json) =>
      _$SurgeryLocationModelFromJson(json);

  factory SurgeryLocationModel.zero() {
    final timestamp = ModelUtils.getTimestamp;
    return SurgeryLocationModel(
      locationID: ModelUtils.uniqueID,
      timestamp: timestamp,
      createdAt: timestamp,
    );
  }

  final String locationID;
  final String? address;
  final int createdAt;
  final String? name;
  final String? phone;
  final int removed;
  final int timestamp;

  @override
  Map<String, dynamic> toJson() => _$SurgeryLocationModelToJson(this);
}
