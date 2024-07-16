import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

import '../../app_models.dart';

part 'case_model.g.dart';
part 'case_model.realm.dart';

enum CaseModelProps {
  caseID,
  patientData,
  pcpModel,
  fieldsData,
  templateID,
  createdAt,
  removed,
  timestamp,
}

/// basic case data fields emun
enum BasicDataModelProps {
  surgeryDate,
  diagnosis,
  surgery,
  anesthesia,
  anesthesiaBlock,
  asa,
  bmi,
  side,
  ebl,
  assistant,
  location,
  comments,
  icd,
  cpt;
}

class HybridCaseModel {
  HybridCaseModel({
    required this.caseModel,
    required this.mediaModels,
  });

  final CaseModel caseModel;
  final List<MediaModel> mediaModels;
}

@RealmModel()
@JsonSerializable(explicitToJson: true)
class _CaseModel {
  @PrimaryKey()
  late String caseID;
  late int surgeryDate = 0;
  late int createdAt = 0;
  late String? anesthesia;
  late String? anesthesiaBlock;
  late int asa = 2;
  late List<String> assistant = [];
  @Indexed(RealmIndexType.fullText)
  late String? comments;
  late String? cpt;
  @Indexed(RealmIndexType.fullText)
  late String? diagnosis;
  late int ebl = 0;
  late String? icd;
  @Indexed()
  late String? location;
  late String? side;
  @Indexed(RealmIndexType.fullText)
  late String? surgery;
  late String? templateID;
  @Indexed()
  late int removed = 0;
  late int timestamp = 0;
  late _PatientModel? patientModel;
  late List<$TemplateFieldModel> fieldsData = [];
  late List<_MediaModel> medias = [];
  late List<$TimelineNoteModel> notes = [];

  //@JsonKey(includeFromJson: false, includeToJson: false)
  //@Ignored()
  // One-to-many relationship that the backlink is created for  in media Model.
  //late List<_MediaModel> mediaModels;

  CaseModel toRealmObject() {
    return CaseModel(
      caseID,
      surgeryDate: surgeryDate,
      createdAt: createdAt,
      anesthesia: anesthesia,
      anesthesiaBlock: anesthesiaBlock,
      asa: asa,
      assistant: assistant,
      comments: comments,
      cpt: cpt,
      diagnosis: diagnosis,
      ebl: ebl,
      icd: icd,
      location: location,
      side: side,
      surgery: surgery,
      templateID: templateID,
      removed: removed,
      patientModel: patientModel?.toRealmObject(),
      timestamp: timestamp,
      fieldsData: fieldsData
          .map((e) => TemplateFieldModelX.fromJson(e.toJson()))
          .toList(),
      medias: medias.map((e) => MediaModelX.fromJson(e.toJson())).toList(),
      notes: notes.map((e) => TimelineNoteModelX.fromJson(e.toJson())).toList(),
    );
  }
}

extension CaseModelX on CaseModel {
  static CaseModel fromJson(Map<String, dynamic> json) =>
      _$CaseModelFromJson(json).toRealmObject();

  Map<String, dynamic> toJson() => _$CaseModelToJson(this);

  static CaseModel zero() {
    final timestamp = ModelUtils.getTimestamp;

    final caseModel = CaseModel(
      ModelUtils.uniqueID,
      patientModel: PatientModelX.zero(),
      medias: [],
      notes: [],
      surgeryDate: timestamp,
      createdAt: timestamp,
      timestamp: timestamp,
    );

    return caseModel;
  }

  ///create surgery date split field
  @JsonKey(includeFromJson: false, includeToJson: false)
  String get surgeryD =>
      DateFormat('dd').format(DateTime.fromMillisecondsSinceEpoch(surgeryDate));

  @JsonKey(includeFromJson: false, includeToJson: false)
  String get surgeryM => DateFormat('MMM')
      .format(DateTime.fromMillisecondsSinceEpoch(surgeryDate));

  @JsonKey(includeFromJson: false, includeToJson: false)
  String get surgeryY => DateFormat('yyyy')
      .format(DateTime.fromMillisecondsSinceEpoch(surgeryDate));
}

/// ////////////////////////////////////////////////////////////////////
/// Patient Model
/// ////////////////////////////////////////////////////////////////////
/// basic case data fields emun
enum PatientDataModelProps {
  patientID,
  crypt,
  initials,
  name,
  yob,
  bmi,
  gender,
  mrn,
  phone,
  address,
}

/// Patient Data Model

@RealmModel()
@JsonSerializable(explicitToJson: true)
class _PatientModel {
  late String? crypt;
  @Indexed(RealmIndexType.fullText)
  late String? initials;
  late String? name;
  late String? yob;
  late double? bmi = 0;
  late String? gender;
  late String? mrn;
  late String? phone;
  late String? address;

  PatientModel toRealmObject() {
    return PatientModel(
      crypt: crypt,
      initials: initials,
      name: name,
      yob: yob,
      bmi: bmi,
      gender: gender,
      mrn: mrn,
      phone: phone,
      address: address,
    );
  }

  static PatientModel fromJson(Map<String, dynamic> json) =>
      _$PatientModelFromJson(json).toRealmObject();

  Map<String, dynamic> toJson() => _$PatientModelToJson(this);
}

extension PatientModelX on PatientModel {
  static PatientModel fromJson(Map<String, dynamic> json) =>
      _$PatientModelFromJson(json).toRealmObject();

  Map<String, dynamic> toJson() => _$PatientModelToJson(this);

  static PatientModel zero() {
    final patientModel = PatientModel();

    return patientModel;
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Decrypted patiet model
/// ////////////////////////////////////////////////////////////////////
/// for forms
enum DecryptedPatientDataModelProps { address, mrn, name, phone }

@JsonSerializable(createToJson: true, explicitToJson: true)
class DecryptedPatientModel {
  // ignore: prefer_const_constructors_in_immutables
  DecryptedPatientModel({
    //required this.patientID,
    this.name,
    this.mrn,
    this.address,
    this.phone,
  });

  factory DecryptedPatientModel.fromJson(Map<String, Object?> json) =>
      _$DecryptedPatientModelFromJson(json);

  //final String patientID;
  final String? address;
  final String? mrn;
  final String? name;
  final String? phone;

  Map<String, dynamic> toJson() => _$DecryptedPatientModelToJson(this);

  DecryptedPatientModel copyWith({
    String? patientID,
    String? address,
    String? mrn,
    String? name,
    String? phone,
  }) {
    return DecryptedPatientModel(
      //patientID: patientID ?? this.patientID,
      address: address ?? this.address,
      mrn: mrn ?? this.mrn,
      name: name ?? this.name,
      phone: phone ?? this.phone,
    );
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Media Model
/// ////////////////////////////////////////////////////////////////////
///Media status
enum MediaStatus {
  cancelled,
  failed,
  processing,
  queued,
  removed,
  success,
  uploading,
}

class HybridMediaModel {
  HybridMediaModel({
    required this.caseModel,
    required this.mediaModel,
  });

  final CaseModel? caseModel;
  final MediaModel mediaModel;
}

@RealmModel()
@JsonSerializable(explicitToJson: true)
class _MediaModel {
  @PrimaryKey()
  late String mediaID;
  late String authorID;
  late String? caseID = 'unknown';
  late String? fileType;
  late String? fileName;
  late String? fileUri;
  late String? mediumUri;
  late String? thumbUri;

  @MapTo('status')
  late String? _status;
  @Ignored()
  MediaStatus get status {
    return MediaStatus.values.byName(_status ?? MediaStatus.queued.name);
  }

  @Ignored()
  set status(MediaStatus value) => _status = value.name;

  @Indexed(RealmIndexType.fullText)
  late String? comment;
  @Indexed()
  late int removed = 0;
  late int createdAt = 0;
  late int timestamp = 0;

  // Backlink field. Links back to the `tasks` property in the `odel` model.
  // @JsonKey(includeFromJson: false, includeToJson: false)
  // @Backlink(#mediaModels)
  // late Iterable<_CaseModel> linkedCaseModel;

  MediaModel toRealmObject() {
    return MediaModel(
      mediaID,
      authorID,
      fileType: fileType,
      fileName: fileName,
      fileUri: fileUri,
      mediumUri: mediumUri,
      thumbUri: thumbUri,
      caseID: caseID,
      status: _status,
      comment: comment,
      removed: removed,
      createdAt: createdAt,
      timestamp: timestamp,
    );
  }

  static MediaModel fromJson(Map<String, dynamic> json) =>
      MediaModelX.fromJson(json);

  Map<String, dynamic> toJson() => _$MediaModelToJson(this);
}

extension MediaModelX on MediaModel {
  static MediaModel fromJson(Map<String, dynamic> json) =>
      _$MediaModelFromJson(json).toRealmObject();

  Map<String, dynamic> toJson() => _$MediaModelToJson(this);

  static MediaModel zero(String authorID) {
    final timestamp = ModelUtils.getTimestamp;

    final mediaModel = MediaModel(
      ModelUtils.uniqueID,
      authorID,
      createdAt: timestamp,
      timestamp: timestamp,
    );

    return mediaModel;
  }
}
