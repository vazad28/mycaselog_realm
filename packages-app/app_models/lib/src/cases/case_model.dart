import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

import '../model_utils.dart';
import '../templates/template_field_model.dart';

part 'case_model.realm.dart';
part 'case_model.g.dart';

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

@RealmModel()
@JsonSerializable(explicitToJson: true)
class _CaseModel {
  @PrimaryKey()
  late String caseID;
  late int? surgeryDate;
  late _PatientModel? patientModel;
  late int? createdAt;
  late String? anesthesia;
  late String? anesthesiaBlock;
  late int? asa = 2;
  late List<String> assistant = [];
  @Indexed(RealmIndexType.fullText)
  late String? comments;
  late String? cpt;
  @Indexed(RealmIndexType.fullText)
  late String? diagnosis;
  late int? ebl = 0;
  late String? icd;
  late String? location;
  late String? side;
  @Indexed(RealmIndexType.fullText)
  late String? surgery;
  // late PcpModel? pcpModel;
  late List<$TemplateFieldModel> fieldsData = [];
  late String? templateID;
  late int? removed = 0;
  late int? timestamp = 0;
}

extension CaseModelX on CaseModel {
  static CaseModel _toRealmObject(_CaseModel caseModel) {
    return CaseModel(
      caseModel.caseID,
      surgeryDate: caseModel.surgeryDate,
      createdAt: caseModel.timestamp,
      timestamp: caseModel.timestamp,
    );
  }

  static CaseModel zero() {
    final timestamp = ModelUtils.getTimestamp;

    final caseModel = CaseModel(
      ModelUtils.uniqueID,
      patientModel: PatientModelX.zero(),
      surgeryDate: timestamp,
      createdAt: timestamp,
      timestamp: timestamp,
    );

    return caseModel;
  }

  static CaseModel fromJson(Map<String, dynamic> json) =>
      _toRealmObject(_$CaseModelFromJson(json));

  Map<String, dynamic> toJson() => _$CaseModelToJson(this);
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
  createdAt,
  timestamp;
}

/// Patient Data Model

@RealmModel()
@JsonSerializable(explicitToJson: true)
class _PatientModel {
  @PrimaryKey()
  late String patientID;
  late String? crypt;
  late String? initials;
  late String? name;
  late String? yob;
  late double? bmi = 0;
  late String? gender;
  late String? mrn;
  late String? phone;
  late String? address;
  late int? createdAt = 0;
  late int? timestamp = 0;

  static PatientModel fromJson(Map<String, dynamic> json) =>
      PatientModelX.fromJson(json);

  Map<String, dynamic> toJson() => _$PatientModelToJson(this);
}

extension PatientModelX on PatientModel {
  static PatientModel _toRealmObject(_PatientModel patientModel) {
    return PatientModel(
      patientModel.patientID,
      createdAt: patientModel.timestamp,
      timestamp: patientModel.timestamp,
    );
  }

  static PatientModel zero() {
    final patientModel = PatientModel(
      ModelUtils.uniqueID,
    );

    return patientModel;
  }

  static PatientModel fromJson(Map<String, dynamic> json) =>
      _toRealmObject(_$PatientModelFromJson(json));

  Map<String, dynamic> toJson() => _$PatientModelToJson(this);
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
    this.name,
    this.mrn,
    this.address,
    this.phone,
  });

  factory DecryptedPatientModel.fromJson(Map<String, Object?> json) =>
      _$DecryptedPatientModelFromJson(json);

  final String? address;
  final String? mrn;
  final String? name;
  final String? phone;

  Map<String, dynamic> toJson() => _$DecryptedPatientModelToJson(this);

  DecryptedPatientModel copyWith({
    String? address,
    String? mrn,
    String? name,
    String? phone,
  }) {
    return DecryptedPatientModel(
      address: address ?? this.address,
      mrn: mrn ?? this.mrn,
      name: name ?? this.name,
      phone: phone ?? this.phone,
    );
  }
}
