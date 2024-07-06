// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'case_model.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CaseModel extends _CaseModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  CaseModel(
    String caseID, {
    int surgeryDate = 0,
    PatientModel? patientModel,
    int createdAt = 0,
    String? anesthesia,
    String? anesthesiaBlock,
    int asa = 2,
    Iterable<String> assistant = const [],
    String? comments,
    String? cpt,
    String? diagnosis,
    int ebl = 0,
    String? icd,
    String? location,
    String? side,
    String? surgery,
    Iterable<TemplateFieldModel> fieldsData = const [],
    String? templateID,
    int removed = 0,
    int timestamp = 0,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<CaseModel>({
        'surgeryDate': 0,
        'createdAt': 0,
        'asa': 2,
        'ebl': 0,
        'removed': 0,
        'timestamp': 0,
      });
    }
    RealmObjectBase.set(this, 'caseID', caseID);
    RealmObjectBase.set(this, 'surgeryDate', surgeryDate);
    RealmObjectBase.set(this, 'patientModel', patientModel);
    RealmObjectBase.set(this, 'createdAt', createdAt);
    RealmObjectBase.set(this, 'anesthesia', anesthesia);
    RealmObjectBase.set(this, 'anesthesiaBlock', anesthesiaBlock);
    RealmObjectBase.set(this, 'asa', asa);
    RealmObjectBase.set<RealmList<String>>(
        this, 'assistant', RealmList<String>(assistant));
    RealmObjectBase.set(this, 'comments', comments);
    RealmObjectBase.set(this, 'cpt', cpt);
    RealmObjectBase.set(this, 'diagnosis', diagnosis);
    RealmObjectBase.set(this, 'ebl', ebl);
    RealmObjectBase.set(this, 'icd', icd);
    RealmObjectBase.set(this, 'location', location);
    RealmObjectBase.set(this, 'side', side);
    RealmObjectBase.set(this, 'surgery', surgery);
    RealmObjectBase.set<RealmList<TemplateFieldModel>>(
        this, 'fieldsData', RealmList<TemplateFieldModel>(fieldsData));
    RealmObjectBase.set(this, 'templateID', templateID);
    RealmObjectBase.set(this, 'removed', removed);
    RealmObjectBase.set(this, 'timestamp', timestamp);
  }

  CaseModel._();

  @override
  String get caseID => RealmObjectBase.get<String>(this, 'caseID') as String;
  @override
  set caseID(String value) => RealmObjectBase.set(this, 'caseID', value);

  @override
  int get surgeryDate => RealmObjectBase.get<int>(this, 'surgeryDate') as int;
  @override
  set surgeryDate(int value) => RealmObjectBase.set(this, 'surgeryDate', value);

  @override
  PatientModel? get patientModel =>
      RealmObjectBase.get<PatientModel>(this, 'patientModel') as PatientModel?;
  @override
  set patientModel(covariant PatientModel? value) =>
      RealmObjectBase.set(this, 'patientModel', value);

  @override
  int get createdAt => RealmObjectBase.get<int>(this, 'createdAt') as int;
  @override
  set createdAt(int value) => RealmObjectBase.set(this, 'createdAt', value);

  @override
  String? get anesthesia =>
      RealmObjectBase.get<String>(this, 'anesthesia') as String?;
  @override
  set anesthesia(String? value) =>
      RealmObjectBase.set(this, 'anesthesia', value);

  @override
  String? get anesthesiaBlock =>
      RealmObjectBase.get<String>(this, 'anesthesiaBlock') as String?;
  @override
  set anesthesiaBlock(String? value) =>
      RealmObjectBase.set(this, 'anesthesiaBlock', value);

  @override
  int get asa => RealmObjectBase.get<int>(this, 'asa') as int;
  @override
  set asa(int value) => RealmObjectBase.set(this, 'asa', value);

  @override
  RealmList<String> get assistant =>
      RealmObjectBase.get<String>(this, 'assistant') as RealmList<String>;
  @override
  set assistant(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  String? get comments =>
      RealmObjectBase.get<String>(this, 'comments') as String?;
  @override
  set comments(String? value) => RealmObjectBase.set(this, 'comments', value);

  @override
  String? get cpt => RealmObjectBase.get<String>(this, 'cpt') as String?;
  @override
  set cpt(String? value) => RealmObjectBase.set(this, 'cpt', value);

  @override
  String? get diagnosis =>
      RealmObjectBase.get<String>(this, 'diagnosis') as String?;
  @override
  set diagnosis(String? value) => RealmObjectBase.set(this, 'diagnosis', value);

  @override
  int get ebl => RealmObjectBase.get<int>(this, 'ebl') as int;
  @override
  set ebl(int value) => RealmObjectBase.set(this, 'ebl', value);

  @override
  String? get icd => RealmObjectBase.get<String>(this, 'icd') as String?;
  @override
  set icd(String? value) => RealmObjectBase.set(this, 'icd', value);

  @override
  String? get location =>
      RealmObjectBase.get<String>(this, 'location') as String?;
  @override
  set location(String? value) => RealmObjectBase.set(this, 'location', value);

  @override
  String? get side => RealmObjectBase.get<String>(this, 'side') as String?;
  @override
  set side(String? value) => RealmObjectBase.set(this, 'side', value);

  @override
  String? get surgery =>
      RealmObjectBase.get<String>(this, 'surgery') as String?;
  @override
  set surgery(String? value) => RealmObjectBase.set(this, 'surgery', value);

  @override
  RealmList<TemplateFieldModel> get fieldsData =>
      RealmObjectBase.get<TemplateFieldModel>(this, 'fieldsData')
          as RealmList<TemplateFieldModel>;
  @override
  set fieldsData(covariant RealmList<TemplateFieldModel> value) =>
      throw RealmUnsupportedSetError();

  @override
  String? get templateID =>
      RealmObjectBase.get<String>(this, 'templateID') as String?;
  @override
  set templateID(String? value) =>
      RealmObjectBase.set(this, 'templateID', value);

  @override
  int get removed => RealmObjectBase.get<int>(this, 'removed') as int;
  @override
  set removed(int value) => RealmObjectBase.set(this, 'removed', value);

  @override
  int get timestamp => RealmObjectBase.get<int>(this, 'timestamp') as int;
  @override
  set timestamp(int value) => RealmObjectBase.set(this, 'timestamp', value);

  @override
  Stream<RealmObjectChanges<CaseModel>> get changes =>
      RealmObjectBase.getChanges<CaseModel>(this);

  @override
  Stream<RealmObjectChanges<CaseModel>> changesFor([List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<CaseModel>(this, keyPaths);

  @override
  CaseModel freeze() => RealmObjectBase.freezeObject<CaseModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'caseID': caseID.toEJson(),
      'surgeryDate': surgeryDate.toEJson(),
      'patientModel': patientModel.toEJson(),
      'createdAt': createdAt.toEJson(),
      'anesthesia': anesthesia.toEJson(),
      'anesthesiaBlock': anesthesiaBlock.toEJson(),
      'asa': asa.toEJson(),
      'assistant': assistant.toEJson(),
      'comments': comments.toEJson(),
      'cpt': cpt.toEJson(),
      'diagnosis': diagnosis.toEJson(),
      'ebl': ebl.toEJson(),
      'icd': icd.toEJson(),
      'location': location.toEJson(),
      'side': side.toEJson(),
      'surgery': surgery.toEJson(),
      'fieldsData': fieldsData.toEJson(),
      'templateID': templateID.toEJson(),
      'removed': removed.toEJson(),
      'timestamp': timestamp.toEJson(),
    };
  }

  static EJsonValue _toEJson(CaseModel value) => value.toEJson();
  static CaseModel _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'caseID': EJsonValue caseID,
        'surgeryDate': EJsonValue surgeryDate,
        'patientModel': EJsonValue patientModel,
        'createdAt': EJsonValue createdAt,
        'anesthesia': EJsonValue anesthesia,
        'anesthesiaBlock': EJsonValue anesthesiaBlock,
        'asa': EJsonValue asa,
        'assistant': EJsonValue assistant,
        'comments': EJsonValue comments,
        'cpt': EJsonValue cpt,
        'diagnosis': EJsonValue diagnosis,
        'ebl': EJsonValue ebl,
        'icd': EJsonValue icd,
        'location': EJsonValue location,
        'side': EJsonValue side,
        'surgery': EJsonValue surgery,
        'fieldsData': EJsonValue fieldsData,
        'templateID': EJsonValue templateID,
        'removed': EJsonValue removed,
        'timestamp': EJsonValue timestamp,
      } =>
        CaseModel(
          fromEJson(caseID),
          surgeryDate: fromEJson(surgeryDate),
          patientModel: fromEJson(patientModel),
          createdAt: fromEJson(createdAt),
          anesthesia: fromEJson(anesthesia),
          anesthesiaBlock: fromEJson(anesthesiaBlock),
          asa: fromEJson(asa),
          assistant: fromEJson(assistant),
          comments: fromEJson(comments),
          cpt: fromEJson(cpt),
          diagnosis: fromEJson(diagnosis),
          ebl: fromEJson(ebl),
          icd: fromEJson(icd),
          location: fromEJson(location),
          side: fromEJson(side),
          surgery: fromEJson(surgery),
          fieldsData: fromEJson(fieldsData),
          templateID: fromEJson(templateID),
          removed: fromEJson(removed),
          timestamp: fromEJson(timestamp),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(CaseModel._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, CaseModel, 'CaseModel', [
      SchemaProperty('caseID', RealmPropertyType.string, primaryKey: true),
      SchemaProperty('surgeryDate', RealmPropertyType.int),
      SchemaProperty('patientModel', RealmPropertyType.object,
          optional: true, linkTarget: 'PatientModel'),
      SchemaProperty('createdAt', RealmPropertyType.int),
      SchemaProperty('anesthesia', RealmPropertyType.string, optional: true),
      SchemaProperty('anesthesiaBlock', RealmPropertyType.string,
          optional: true),
      SchemaProperty('asa', RealmPropertyType.int),
      SchemaProperty('assistant', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('comments', RealmPropertyType.string,
          optional: true, indexType: RealmIndexType.fullText),
      SchemaProperty('cpt', RealmPropertyType.string, optional: true),
      SchemaProperty('diagnosis', RealmPropertyType.string,
          optional: true, indexType: RealmIndexType.fullText),
      SchemaProperty('ebl', RealmPropertyType.int),
      SchemaProperty('icd', RealmPropertyType.string, optional: true),
      SchemaProperty('location', RealmPropertyType.string,
          optional: true, indexType: RealmIndexType.regular),
      SchemaProperty('side', RealmPropertyType.string, optional: true),
      SchemaProperty('surgery', RealmPropertyType.string,
          optional: true, indexType: RealmIndexType.fullText),
      SchemaProperty('fieldsData', RealmPropertyType.object,
          linkTarget: 'TemplateFieldModel',
          collectionType: RealmCollectionType.list),
      SchemaProperty('templateID', RealmPropertyType.string, optional: true),
      SchemaProperty('removed', RealmPropertyType.int,
          indexType: RealmIndexType.regular),
      SchemaProperty('timestamp', RealmPropertyType.int),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}

class PatientModel extends _PatientModel
    with RealmEntity, RealmObjectBase, RealmObject {
  static var _defaultsSet = false;

  PatientModel({
    String? crypt,
    String? initials,
    String? name,
    String? yob,
    double bmi = 0,
    String? gender,
    String? mrn,
    String? phone,
    String? address,
  }) {
    if (!_defaultsSet) {
      _defaultsSet = RealmObjectBase.setDefaults<PatientModel>({
        'bmi': 0,
      });
    }
    RealmObjectBase.set(this, 'crypt', crypt);
    RealmObjectBase.set(this, 'initials', initials);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'yob', yob);
    RealmObjectBase.set(this, 'bmi', bmi);
    RealmObjectBase.set(this, 'gender', gender);
    RealmObjectBase.set(this, 'mrn', mrn);
    RealmObjectBase.set(this, 'phone', phone);
    RealmObjectBase.set(this, 'address', address);
  }

  PatientModel._();

  @override
  String? get crypt => RealmObjectBase.get<String>(this, 'crypt') as String?;
  @override
  set crypt(String? value) => RealmObjectBase.set(this, 'crypt', value);

  @override
  String? get initials =>
      RealmObjectBase.get<String>(this, 'initials') as String?;
  @override
  set initials(String? value) => RealmObjectBase.set(this, 'initials', value);

  @override
  String? get name => RealmObjectBase.get<String>(this, 'name') as String?;
  @override
  set name(String? value) => RealmObjectBase.set(this, 'name', value);

  @override
  String? get yob => RealmObjectBase.get<String>(this, 'yob') as String?;
  @override
  set yob(String? value) => RealmObjectBase.set(this, 'yob', value);

  @override
  double get bmi => RealmObjectBase.get<double>(this, 'bmi') as double;
  @override
  set bmi(double value) => RealmObjectBase.set(this, 'bmi', value);

  @override
  String? get gender => RealmObjectBase.get<String>(this, 'gender') as String?;
  @override
  set gender(String? value) => RealmObjectBase.set(this, 'gender', value);

  @override
  String? get mrn => RealmObjectBase.get<String>(this, 'mrn') as String?;
  @override
  set mrn(String? value) => RealmObjectBase.set(this, 'mrn', value);

  @override
  String? get phone => RealmObjectBase.get<String>(this, 'phone') as String?;
  @override
  set phone(String? value) => RealmObjectBase.set(this, 'phone', value);

  @override
  String? get address =>
      RealmObjectBase.get<String>(this, 'address') as String?;
  @override
  set address(String? value) => RealmObjectBase.set(this, 'address', value);

  @override
  Stream<RealmObjectChanges<PatientModel>> get changes =>
      RealmObjectBase.getChanges<PatientModel>(this);

  @override
  Stream<RealmObjectChanges<PatientModel>> changesFor(
          [List<String>? keyPaths]) =>
      RealmObjectBase.getChangesFor<PatientModel>(this, keyPaths);

  @override
  PatientModel freeze() => RealmObjectBase.freezeObject<PatientModel>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'crypt': crypt.toEJson(),
      'initials': initials.toEJson(),
      'name': name.toEJson(),
      'yob': yob.toEJson(),
      'bmi': bmi.toEJson(),
      'gender': gender.toEJson(),
      'mrn': mrn.toEJson(),
      'phone': phone.toEJson(),
      'address': address.toEJson(),
    };
  }

  static EJsonValue _toEJson(PatientModel value) => value.toEJson();
  static PatientModel _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'crypt': EJsonValue crypt,
        'initials': EJsonValue initials,
        'name': EJsonValue name,
        'yob': EJsonValue yob,
        'bmi': EJsonValue bmi,
        'gender': EJsonValue gender,
        'mrn': EJsonValue mrn,
        'phone': EJsonValue phone,
        'address': EJsonValue address,
      } =>
        PatientModel(
          crypt: fromEJson(crypt),
          initials: fromEJson(initials),
          name: fromEJson(name),
          yob: fromEJson(yob),
          bmi: fromEJson(bmi),
          gender: fromEJson(gender),
          mrn: fromEJson(mrn),
          phone: fromEJson(phone),
          address: fromEJson(address),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(PatientModel._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, PatientModel, 'PatientModel', [
      SchemaProperty('crypt', RealmPropertyType.string, optional: true),
      SchemaProperty('initials', RealmPropertyType.string,
          optional: true, indexType: RealmIndexType.fullText),
      SchemaProperty('name', RealmPropertyType.string, optional: true),
      SchemaProperty('yob', RealmPropertyType.string, optional: true),
      SchemaProperty('bmi', RealmPropertyType.double),
      SchemaProperty('gender', RealmPropertyType.string, optional: true),
      SchemaProperty('mrn', RealmPropertyType.string, optional: true),
      SchemaProperty('phone', RealmPropertyType.string, optional: true),
      SchemaProperty('address', RealmPropertyType.string, optional: true),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
