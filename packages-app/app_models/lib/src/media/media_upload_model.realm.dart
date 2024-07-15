// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_upload_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class MediaUploadModel extends _MediaUploadModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  MediaUploadModel(
    String mediaID,
    String caseID, {
    String fileUri = '',
    String? mediumUri,
    String? thumbUri,
    double uoloadProgress = 0,
    String? status,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<MediaUploadModel>({
        'fileUri': '',
        'uoloadProgress': 0,
      });
    }
    RealmObjectBase.set(this, 'mediaID', mediaID);
    RealmObjectBase.set(this, 'caseID', caseID);
    RealmObjectBase.set(this, 'fileUri', fileUri);
    RealmObjectBase.set(this, 'mediumUri', mediumUri);
    RealmObjectBase.set(this, 'thumbUri', thumbUri);
    RealmObjectBase.set(this, 'uoloadProgress', uoloadProgress);
    RealmObjectBase.set(this, 'status', status);
  }

  MediaUploadModel._();

  @override
  String get mediaID => RealmObjectBase.get<String>(this, 'mediaID') as String;
  @override
  set mediaID(String value) => RealmObjectBase.set(this, 'mediaID', value);

  @override
  String get caseID => RealmObjectBase.get<String>(this, 'caseID') as String;
  @override
  set caseID(String value) => RealmObjectBase.set(this, 'caseID', value);

  @override
  String get fileUri => RealmObjectBase.get<String>(this, 'fileUri') as String;
  @override
  set fileUri(String value) => RealmObjectBase.set(this, 'fileUri', value);

  @override
  String? get mediumUri =>
      RealmObjectBase.get<String>(this, 'mediumUri') as String?;
  @override
  set mediumUri(String? value) => RealmObjectBase.set(this, 'mediumUri', value);

  @override
  String? get thumbUri =>
      RealmObjectBase.get<String>(this, 'thumbUri') as String?;
  @override
  set thumbUri(String? value) => RealmObjectBase.set(this, 'thumbUri', value);

  @override
  double get uoloadProgress =>
      RealmObjectBase.get<double>(this, 'uoloadProgress') as double;
  @override
  set uoloadProgress(double value) =>
      RealmObjectBase.set(this, 'uoloadProgress', value);

  @override
  String? get _status => RealmObjectBase.get<String>(this, 'status') as String?;
  @override
  set _status(String? value) => RealmObjectBase.set(this, 'status', value);

  @override
  Stream<RealmObjectChanges<MediaUploadModel>> get changes =>
      RealmObjectBase.getChanges<MediaUploadModel>(this);

  @override
  Stream<RealmObjectChanges<MediaUploadModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<MediaUploadModel>(this, keyPaths);

  @override
  MediaUploadModel freeze() =>
      RealmObjectBase.freezeObject<MediaUploadModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'mediaID': mediaID.toEJson(),
      'caseID': caseID.toEJson(),
      'fileUri': fileUri.toEJson(),
      'mediumUri': mediumUri.toEJson(),
      'thumbUri': thumbUri.toEJson(),
      'uoloadProgress': uoloadProgress.toEJson(),
      'status': _status.toEJson(),
    };
  }

  static EJsonValue _toEJson(MediaUploadModel value) => value.toEJson();
  static MediaUploadModel _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'mediaID': EJsonValue mediaID,
        'caseID': EJsonValue caseID,
        'fileUri': EJsonValue fileUri,
        'mediumUri': EJsonValue mediumUri,
        'thumbUri': EJsonValue thumbUri,
        'uoloadProgress': EJsonValue uoloadProgress,
        'status': EJsonValue _status,
      } =>
        MediaUploadModel(
          fromEJson(mediaID),
          fromEJson(caseID),
          fileUri: fromEJson(fileUri),
          mediumUri: fromEJson(mediumUri),
          thumbUri: fromEJson(thumbUri),
          uoloadProgress: fromEJson(uoloadProgress),
          status: fromEJson(_status),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(MediaUploadModel._);
    register(_toEJson, _fromEJson);
    return SchemaObject(
        ObjectType.realmObject, MediaUploadModel, 'MediaUploadModel', [
      SchemaProperty('mediaID', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('caseID', RealmPropertyType.string),
      SchemaProperty('fileUri', RealmPropertyType.string),
      SchemaProperty('mediumUri', RealmPropertyType.string, optional: true),
      SchemaProperty('thumbUri', RealmPropertyType.string, optional: true),
      SchemaProperty('uoloadProgress', RealmPropertyType.double),
      SchemaProperty('_status', RealmPropertyType.string,
          mapTo: 'status', optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
