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
    String mediaID, {
    String? caseID,
    String fileUri = '',
    String? medium,
    String? thumb,
    double uploadProgress = 0,
    String? status,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<MediaUploadModel>({
        'fileUri': '',
        'uploadProgress': 0,
      });
    }
    RealmObjectBase.set(this, 'mediaID', mediaID);
    RealmObjectBase.set(this, 'caseID', caseID);
    RealmObjectBase.set(this, 'fileUri', fileUri);
    RealmObjectBase.set(this, 'medium', medium);
    RealmObjectBase.set(this, 'thumb', thumb);
    RealmObjectBase.set(this, 'uploadProgress', uploadProgress);
    RealmObjectBase.set(this, 'status', status);
  }

  MediaUploadModel._();

  @override
  String get mediaID => RealmObjectBase.get<String>(this, 'mediaID') as String;
  @override
  set mediaID(String value) => RealmObjectBase.set(this, 'mediaID', value);

  @override
  String? get caseID => RealmObjectBase.get<String>(this, 'caseID') as String?;
  @override
  set caseID(String? value) => RealmObjectBase.set(this, 'caseID', value);

  @override
  String get fileUri => RealmObjectBase.get<String>(this, 'fileUri') as String;
  @override
  set fileUri(String value) => RealmObjectBase.set(this, 'fileUri', value);

  @override
  String? get medium => RealmObjectBase.get<String>(this, 'medium') as String?;
  @override
  set medium(String? value) => RealmObjectBase.set(this, 'medium', value);

  @override
  String? get thumb => RealmObjectBase.get<String>(this, 'thumb') as String?;
  @override
  set thumb(String? value) => RealmObjectBase.set(this, 'thumb', value);

  @override
  double get uploadProgress =>
      RealmObjectBase.get<double>(this, 'uploadProgress') as double;
  @override
  set uploadProgress(double value) =>
      RealmObjectBase.set(this, 'uploadProgress', value);

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
      'medium': medium.toEJson(),
      'thumb': thumb.toEJson(),
      'uploadProgress': uploadProgress.toEJson(),
      'status': _status.toEJson(),
    };
  }

  static EJsonValue _toEJson(MediaUploadModel value) => value.toEJson();
  static MediaUploadModel _fromEJson(EJsonValue ejson) {
    if (ejson is! Map<String, dynamic>) return raiseInvalidEJson(ejson);
    return switch (ejson) {
      {
        'mediaID': EJsonValue mediaID,
      } =>
        MediaUploadModel(
          fromEJson(mediaID),
          caseID: fromEJson(ejson['caseID']),
          fileUri: fromEJson(ejson['fileUri'], defaultValue: ''),
          medium: fromEJson(ejson['medium']),
          thumb: fromEJson(ejson['thumb']),
          uploadProgress: fromEJson(ejson['uploadProgress'], defaultValue: 0),
          status: fromEJson(ejson['status']),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(MediaUploadModel._);
    register(_toEJson, _fromEJson);
    return const SchemaObject(
        ObjectType.realmObject, MediaUploadModel, 'MediaUploadModel', [
      SchemaProperty('mediaID', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('caseID', RealmPropertyType.string, optional: true),
      SchemaProperty('fileUri', RealmPropertyType.string),
      SchemaProperty('medium', RealmPropertyType.string, optional: true),
      SchemaProperty('thumb', RealmPropertyType.string, optional: true),
      SchemaProperty('uploadProgress', RealmPropertyType.double),
      SchemaProperty('_status', RealmPropertyType.string,
          mapTo: 'status', optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
