// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'case_model_equatable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CaseModelEquatable _$CaseModelEquatableFromJson(Map<String, dynamic> json) =>
    CaseModelEquatable(
      fieldsData: (json['fieldsData'] as List<dynamic>)
          .map((e) =>
              TemplateFieldModelEquatable.fromJson(e as Map<String, dynamic>))
          .toList(),
      caseID: json['caseID'] as String?,
      patientModel: json['patientModel'] == null
          ? null
          : PatientModelEquatable.fromJson(
              json['patientModel'] as Map<String, dynamic>),
      surgeryDate: (json['surgeryDate'] as num?)?.toInt(),
      createdAt: (json['createdAt'] as num?)?.toInt(),
      anesthesia: json['anesthesia'] as String?,
      anesthesiaBlock: json['anesthesiaBlock'] as String?,
      asa: (json['asa'] as num?)?.toInt() ?? 2,
      assistant: (json['assistant'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      comments: json['comments'] as String?,
      cpt: json['cpt'] as String?,
      diagnosis: json['diagnosis'] as String?,
      ebl: (json['ebl'] as num?)?.toInt() ?? 0,
      icd: json['icd'] as String?,
      location: json['location'] as String?,
      side: json['side'] as String?,
      surgery: json['surgery'] as String?,
      templateID: json['templateID'] as String?,
      removed: (json['removed'] as num?)?.toInt() ?? 0,
      timestamp: (json['timestamp'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CaseModelEquatableToJson(CaseModelEquatable instance) =>
    <String, dynamic>{
      'caseID': instance.caseID,
      'patientModel': instance.patientModel,
      'surgeryDate': instance.surgeryDate,
      'createdAt': instance.createdAt,
      'anesthesia': instance.anesthesia,
      'anesthesiaBlock': instance.anesthesiaBlock,
      'asa': instance.asa,
      'assistant': instance.assistant,
      'comments': instance.comments,
      'cpt': instance.cpt,
      'diagnosis': instance.diagnosis,
      'ebl': instance.ebl,
      'icd': instance.icd,
      'location': instance.location,
      'side': instance.side,
      'surgery': instance.surgery,
      'fieldsData': instance.fieldsData,
      'templateID': instance.templateID,
      'removed': instance.removed,
      'timestamp': instance.timestamp,
    };

TemplateFieldModelEquatable _$TemplateFieldModelEquatableFromJson(
        Map<String, dynamic> json) =>
    TemplateFieldModelEquatable(
      fieldID: json['fieldID'] as String,
      title: json['title'] as String?,
      idx: (json['idx'] as num).toInt(),
      isRequired: json['isRequired'] as bool,
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
      defaultValue: json['defaultValue'] as String?,
      value: json['value'] as String?,
      inputMask: json['inputMask'] as String?,
      suffixText: json['suffixText'] as String?,
    );

Map<String, dynamic> _$TemplateFieldModelEquatableToJson(
        TemplateFieldModelEquatable instance) =>
    <String, dynamic>{
      'fieldID': instance.fieldID,
      'title': instance.title,
      'idx': instance.idx,
      'isRequired': instance.isRequired,
      'options': instance.options,
      'defaultValue': instance.defaultValue,
      'value': instance.value,
      'inputMask': instance.inputMask,
      'suffixText': instance.suffixText,
    };

PatientModelEquatable _$PatientModelEquatableFromJson(
        Map<String, dynamic> json) =>
    PatientModelEquatable(
      patientID: json['patientID'] as String?,
      crypt: json['crypt'] as String?,
      initials: json['initials'] as String?,
      name: json['name'] as String?,
      yob: json['yob'] as String?,
      bmi: (json['bmi'] as num?)?.toDouble(),
      gender: json['gender'] as String?,
      mrn: json['mrn'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$PatientModelEquatableToJson(
        PatientModelEquatable instance) =>
    <String, dynamic>{
      'patientID': instance.patientID,
      'crypt': instance.crypt,
      'initials': instance.initials,
      'name': instance.name,
      'yob': instance.yob,
      'bmi': instance.bmi,
      'gender': instance.gender,
      'mrn': instance.mrn,
      'phone': instance.phone,
      'address': instance.address,
    };
