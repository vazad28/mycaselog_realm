// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_data_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SupportDataModelCWProxy {
  SupportDataModel userID(String userID);

  SupportDataModel assistants(List<AssistantModel> assistants);

  SupportDataModel activeBasicFields(List<String> activeBasicFields);

  SupportDataModel anesthesiaBlocks(List<String> anesthesiaBlocks);

  SupportDataModel surgeryLocations(
      List<SurgeryLocationModel> surgeryLocations);

  SupportDataModel timestamp(int timestamp);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportDataModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportDataModel(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportDataModel call({
    String? userID,
    List<AssistantModel>? assistants,
    List<String>? activeBasicFields,
    List<String>? anesthesiaBlocks,
    List<SurgeryLocationModel>? surgeryLocations,
    int? timestamp,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSupportDataModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSupportDataModel.copyWith.fieldName(...)`
class _$SupportDataModelCWProxyImpl implements _$SupportDataModelCWProxy {
  const _$SupportDataModelCWProxyImpl(this._value);

  final SupportDataModel _value;

  @override
  SupportDataModel userID(String userID) => this(userID: userID);

  @override
  SupportDataModel assistants(List<AssistantModel> assistants) =>
      this(assistants: assistants);

  @override
  SupportDataModel activeBasicFields(List<String> activeBasicFields) =>
      this(activeBasicFields: activeBasicFields);

  @override
  SupportDataModel anesthesiaBlocks(List<String> anesthesiaBlocks) =>
      this(anesthesiaBlocks: anesthesiaBlocks);

  @override
  SupportDataModel surgeryLocations(
          List<SurgeryLocationModel> surgeryLocations) =>
      this(surgeryLocations: surgeryLocations);

  @override
  SupportDataModel timestamp(int timestamp) => this(timestamp: timestamp);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SupportDataModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SupportDataModel(...).copyWith(id: 12, name: "My name")
  /// ````
  SupportDataModel call({
    Object? userID = const $CopyWithPlaceholder(),
    Object? assistants = const $CopyWithPlaceholder(),
    Object? activeBasicFields = const $CopyWithPlaceholder(),
    Object? anesthesiaBlocks = const $CopyWithPlaceholder(),
    Object? surgeryLocations = const $CopyWithPlaceholder(),
    Object? timestamp = const $CopyWithPlaceholder(),
  }) {
    return SupportDataModel(
      userID: userID == const $CopyWithPlaceholder() || userID == null
          ? _value.userID
          // ignore: cast_nullable_to_non_nullable
          : userID as String,
      assistants:
          assistants == const $CopyWithPlaceholder() || assistants == null
              ? _value.assistants
              // ignore: cast_nullable_to_non_nullable
              : assistants as List<AssistantModel>,
      activeBasicFields: activeBasicFields == const $CopyWithPlaceholder() ||
              activeBasicFields == null
          ? _value.activeBasicFields
          // ignore: cast_nullable_to_non_nullable
          : activeBasicFields as List<String>,
      anesthesiaBlocks: anesthesiaBlocks == const $CopyWithPlaceholder() ||
              anesthesiaBlocks == null
          ? _value.anesthesiaBlocks
          // ignore: cast_nullable_to_non_nullable
          : anesthesiaBlocks as List<String>,
      surgeryLocations: surgeryLocations == const $CopyWithPlaceholder() ||
              surgeryLocations == null
          ? _value.surgeryLocations
          // ignore: cast_nullable_to_non_nullable
          : surgeryLocations as List<SurgeryLocationModel>,
      timestamp: timestamp == const $CopyWithPlaceholder() || timestamp == null
          ? _value.timestamp
          // ignore: cast_nullable_to_non_nullable
          : timestamp as int,
    );
  }
}

extension $SupportDataModelCopyWith on SupportDataModel {
  /// Returns a callable class that can be used as follows: `instanceOfSupportDataModel.copyWith(...)` or like so:`instanceOfSupportDataModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SupportDataModelCWProxy get copyWith => _$SupportDataModelCWProxyImpl(this);
}

abstract class _$AssistantModelCWProxy {
  AssistantModel assistantID(String assistantID);

  AssistantModel name(String? name);

  AssistantModel phone(String? phone);

  AssistantModel photoUrl(String? photoUrl);

  AssistantModel removed(int removed);

  AssistantModel createdAt(int createdAt);

  AssistantModel timestamp(int timestamp);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AssistantModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AssistantModel(...).copyWith(id: 12, name: "My name")
  /// ````
  AssistantModel call({
    String? assistantID,
    String? name,
    String? phone,
    String? photoUrl,
    int? removed,
    int? createdAt,
    int? timestamp,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAssistantModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAssistantModel.copyWith.fieldName(...)`
class _$AssistantModelCWProxyImpl implements _$AssistantModelCWProxy {
  const _$AssistantModelCWProxyImpl(this._value);

  final AssistantModel _value;

  @override
  AssistantModel assistantID(String assistantID) =>
      this(assistantID: assistantID);

  @override
  AssistantModel name(String? name) => this(name: name);

  @override
  AssistantModel phone(String? phone) => this(phone: phone);

  @override
  AssistantModel photoUrl(String? photoUrl) => this(photoUrl: photoUrl);

  @override
  AssistantModel removed(int removed) => this(removed: removed);

  @override
  AssistantModel createdAt(int createdAt) => this(createdAt: createdAt);

  @override
  AssistantModel timestamp(int timestamp) => this(timestamp: timestamp);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AssistantModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AssistantModel(...).copyWith(id: 12, name: "My name")
  /// ````
  AssistantModel call({
    Object? assistantID = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? photoUrl = const $CopyWithPlaceholder(),
    Object? removed = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? timestamp = const $CopyWithPlaceholder(),
  }) {
    return AssistantModel(
      assistantID:
          assistantID == const $CopyWithPlaceholder() || assistantID == null
              ? _value.assistantID
              // ignore: cast_nullable_to_non_nullable
              : assistantID as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      phone: phone == const $CopyWithPlaceholder()
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as String?,
      photoUrl: photoUrl == const $CopyWithPlaceholder()
          ? _value.photoUrl
          // ignore: cast_nullable_to_non_nullable
          : photoUrl as String?,
      removed: removed == const $CopyWithPlaceholder() || removed == null
          ? _value.removed
          // ignore: cast_nullable_to_non_nullable
          : removed as int,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as int,
      timestamp: timestamp == const $CopyWithPlaceholder() || timestamp == null
          ? _value.timestamp
          // ignore: cast_nullable_to_non_nullable
          : timestamp as int,
    );
  }
}

extension $AssistantModelCopyWith on AssistantModel {
  /// Returns a callable class that can be used as follows: `instanceOfAssistantModel.copyWith(...)` or like so:`instanceOfAssistantModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AssistantModelCWProxy get copyWith => _$AssistantModelCWProxyImpl(this);
}

abstract class _$SurgeryLocationModelCWProxy {
  SurgeryLocationModel locationID(String locationID);

  SurgeryLocationModel name(String? name);

  SurgeryLocationModel phone(String? phone);

  SurgeryLocationModel address(String? address);

  SurgeryLocationModel removed(int removed);

  SurgeryLocationModel createdAt(int createdAt);

  SurgeryLocationModel timestamp(int timestamp);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SurgeryLocationModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SurgeryLocationModel(...).copyWith(id: 12, name: "My name")
  /// ````
  SurgeryLocationModel call({
    String? locationID,
    String? name,
    String? phone,
    String? address,
    int? removed,
    int? createdAt,
    int? timestamp,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSurgeryLocationModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSurgeryLocationModel.copyWith.fieldName(...)`
class _$SurgeryLocationModelCWProxyImpl
    implements _$SurgeryLocationModelCWProxy {
  const _$SurgeryLocationModelCWProxyImpl(this._value);

  final SurgeryLocationModel _value;

  @override
  SurgeryLocationModel locationID(String locationID) =>
      this(locationID: locationID);

  @override
  SurgeryLocationModel name(String? name) => this(name: name);

  @override
  SurgeryLocationModel phone(String? phone) => this(phone: phone);

  @override
  SurgeryLocationModel address(String? address) => this(address: address);

  @override
  SurgeryLocationModel removed(int removed) => this(removed: removed);

  @override
  SurgeryLocationModel createdAt(int createdAt) => this(createdAt: createdAt);

  @override
  SurgeryLocationModel timestamp(int timestamp) => this(timestamp: timestamp);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SurgeryLocationModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SurgeryLocationModel(...).copyWith(id: 12, name: "My name")
  /// ````
  SurgeryLocationModel call({
    Object? locationID = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
    Object? removed = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? timestamp = const $CopyWithPlaceholder(),
  }) {
    return SurgeryLocationModel(
      locationID:
          locationID == const $CopyWithPlaceholder() || locationID == null
              ? _value.locationID
              // ignore: cast_nullable_to_non_nullable
              : locationID as String,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      phone: phone == const $CopyWithPlaceholder()
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as String?,
      address: address == const $CopyWithPlaceholder()
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as String?,
      removed: removed == const $CopyWithPlaceholder() || removed == null
          ? _value.removed
          // ignore: cast_nullable_to_non_nullable
          : removed as int,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as int,
      timestamp: timestamp == const $CopyWithPlaceholder() || timestamp == null
          ? _value.timestamp
          // ignore: cast_nullable_to_non_nullable
          : timestamp as int,
    );
  }
}

extension $SurgeryLocationModelCopyWith on SurgeryLocationModel {
  /// Returns a callable class that can be used as follows: `instanceOfSurgeryLocationModel.copyWith(...)` or like so:`instanceOfSurgeryLocationModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SurgeryLocationModelCWProxy get copyWith =>
      _$SurgeryLocationModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportDataModel _$SupportDataModelFromJson(Map<String, dynamic> json) =>
    SupportDataModel(
      userID: json['userID'] as String,
      assistants: (json['assistants'] as List<dynamic>?)
              ?.map((e) => AssistantModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      activeBasicFields: (json['activeBasicFields'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      anesthesiaBlocks: (json['anesthesiaBlocks'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      surgeryLocations: (json['surgeryLocations'] as List<dynamic>?)
              ?.map((e) =>
                  SurgeryLocationModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      timestamp: (json['timestamp'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$SupportDataModelToJson(SupportDataModel instance) =>
    <String, dynamic>{
      'activeBasicFields': instance.activeBasicFields,
      'anesthesiaBlocks': instance.anesthesiaBlocks,
      'assistants': instance.assistants.map((e) => e.toJson()).toList(),
      'surgeryLocations':
          instance.surgeryLocations.map((e) => e.toJson()).toList(),
      'timestamp': instance.timestamp,
      'userID': instance.userID,
    };

AssistantModel _$AssistantModelFromJson(Map<String, dynamic> json) =>
    AssistantModel(
      assistantID: json['assistantID'] as String,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      photoUrl: json['photoUrl'] as String?,
      removed: (json['removed'] as num?)?.toInt() ?? 0,
      createdAt: (json['createdAt'] as num?)?.toInt() ?? 0,
      timestamp: (json['timestamp'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$AssistantModelToJson(AssistantModel instance) =>
    <String, dynamic>{
      'assistantID': instance.assistantID,
      'createdAt': instance.createdAt,
      'name': instance.name,
      'phone': instance.phone,
      'photoUrl': instance.photoUrl,
      'removed': instance.removed,
      'timestamp': instance.timestamp,
    };

SurgeryLocationModel _$SurgeryLocationModelFromJson(
        Map<String, dynamic> json) =>
    SurgeryLocationModel(
      locationID: json['locationID'] as String,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      removed: (json['removed'] as num?)?.toInt() ?? 0,
      createdAt: (json['createdAt'] as num?)?.toInt() ?? 0,
      timestamp: (json['timestamp'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$SurgeryLocationModelToJson(
        SurgeryLocationModel instance) =>
    <String, dynamic>{
      'locationID': instance.locationID,
      'address': instance.address,
      'createdAt': instance.createdAt,
      'name': instance.name,
      'phone': instance.phone,
      'removed': instance.removed,
      'timestamp': instance.timestamp,
    };
