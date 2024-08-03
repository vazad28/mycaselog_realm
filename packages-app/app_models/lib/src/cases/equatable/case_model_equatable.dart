import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'case_model_equatable.g.dart';

@JsonSerializable(explicitToJson: false)
class CaseModelEquatable extends Equatable {
  const CaseModelEquatable({
    this.caseID,
    this.patientModel,
    this.surgeryDate,
    this.createdAt,
    this.anesthesia,
    this.anesthesiaBlock,
    this.asa = 2, // Default value for asa
    this.assistant = const [],
    this.comments,
    this.cpt,
    this.diagnosis,
    this.ebl = 0, // Default value for ebl
    this.icd,
    this.location,
    this.side,
    this.surgery,
    required this.fieldsData,
    this.templateID,
    this.removed = 0, // Default value for removed
    this.timestamp = 0, // Default value for timestamp
  });

  factory CaseModelEquatable.fromJson(Map<String, dynamic> json) {
    return _$CaseModelEquatableFromJson(json);
  }

  final String? caseID;
  final PatientModelEquatable? patientModel;
  final int? surgeryDate;
  final int? createdAt;
  final String? anesthesia;
  final String? anesthesiaBlock;
  final int asa;
  final List<String>? assistant;
  final String? comments;
  final String? cpt;
  final String? diagnosis;
  final int ebl;
  final String? icd;
  final String? location;
  final String? side;
  final String? surgery;
  final List<TemplateFieldModelEquatable> fieldsData;
  final String? templateID;
  final int removed;
  final int timestamp;

  @override
  List<Object?> get props => [
        caseID,
        patientModel,
        surgeryDate,
        createdAt,
        anesthesia,
        anesthesiaBlock,
        asa,
        assistant,
        comments,
        cpt,
        diagnosis,
        ebl,
        icd,
        location,
        side,
        surgery,
        fieldsData,
        templateID,
        removed,
        timestamp,
      ];
}

@JsonSerializable(explicitToJson: false)
class TemplateFieldModelEquatable extends Equatable {
  const TemplateFieldModelEquatable({
    required this.fieldID,
    required this.title,
    required this.idx,
    required this.isRequired,
    required this.options,
    this.defaultValue,
    this.value,
    this.inputMask,
    this.suffixText,
  });

  factory TemplateFieldModelEquatable.fromJson(Map<String, dynamic> json) {
    return _$TemplateFieldModelEquatableFromJson(json);
  }

  final String fieldID;
  final String? title;
  final int idx;
  final bool isRequired;
  final List<String> options;
  final String? defaultValue;
  final String? value;
  final String? inputMask;
  final String? suffixText;

  @override
  List<Object?> get props => [
        fieldID,
        title,
        idx,
        isRequired,
        options,
        defaultValue,
        value,
        inputMask,
        suffixText,
      ];
}

@JsonSerializable(explicitToJson: false)
class PatientModelEquatable extends Equatable {
  const PatientModelEquatable({
    this.patientID,
    this.crypt,
    this.initials,
    this.name,
    this.yob,
    this.bmi,
    this.gender,
    this.mrn,
    this.phone,
    this.address,
  });

  factory PatientModelEquatable.fromJson(Map<String, dynamic> json) {
    return _$PatientModelEquatableFromJson(json);
  }

  final String? patientID;
  final String? crypt;
  final String? initials;
  final String? name;
  final String? yob;
  final double? bmi;
  final String? gender;
  final String? mrn;
  final String? phone;
  final String? address;

  @override
  List<Object?> get props => [
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
      ];
}
