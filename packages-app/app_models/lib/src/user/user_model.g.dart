// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel()
  ..userID = json['userID'] as String
  ..email = json['email'] as String?
  ..displayName = json['displayName'] as String?
  ..photoUrl = json['photoUrl'] as String?
  ..speciality = json['speciality'] as String?
  ..subSpeciality = json['subSpeciality'] as String?
  ..about = json['about'] as String?
  ..creationTime = (json['creationTime'] as num?)?.toInt()
  ..lastSignInTime = (json['lastSignInTime'] as num?)?.toInt()
  ..timestamp = (json['timestamp'] as num).toInt();

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'userID': instance.userID,
      'email': instance.email,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
      'speciality': instance.speciality,
      'subSpeciality': instance.subSpeciality,
      'about': instance.about,
      'creationTime': instance.creationTime,
      'lastSignInTime': instance.lastSignInTime,
      'timestamp': instance.timestamp,
    };
