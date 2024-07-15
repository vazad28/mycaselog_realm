import 'package:json_annotation/json_annotation.dart';

enum ActivableAddCaseField {
  @JsonKey(name: 'gender')
  gender,
  @JsonKey(name: 'yob')
  yob,
  @JsonKey(name: 'phone')
  phone,
  @JsonKey(name: 'address')
  address,
  @JsonKey(name: 'bmi')
  bmi,
  @JsonKey(name: 'asa')
  asa,
  @JsonKey(name: 'ebl')
  ebl,
  @JsonKey(name: 'side')
  side,
  @JsonKey(name: 'location')
  location,
  @JsonKey(name: 'assistants')
  assistants,
  @JsonKey(name: 'anesthesia')
  anesthesia,
  @JsonKey(name: 'anesthesiaBlock')
  anesthesiaBlock,
  @JsonKey(name: 'pcp')
  pcp,
  @JsonKey(name: 'icd')
  icd,
  @JsonKey(name: 'cpt')
  cpt
}
