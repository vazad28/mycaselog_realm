import 'package:json_annotation/json_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../support_data.dart';

part '../../../../generated/support_data/features/activable_fields/provider/activable_fields_provider.g.dart';

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

/// Provider to keep the state of Assistants
@riverpod
List<ActivableAddCaseField> activableAddCaseFields(
    ActivableAddCaseFieldsRef ref) {
  final activableFields = ref.watch(
    supportDataNotifierProvider.select(
      (value) => value.activeBasicFields,
    ),
  );

  if (activableFields.isEmpty) return ActivableAddCaseField.values;

  return activableFields
      .map((name) => ActivableAddCaseField.values.byName(name))
      .toList();
}
