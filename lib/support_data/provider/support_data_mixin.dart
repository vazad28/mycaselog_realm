part of 'support_data_provider.dart';

/// ////////////////////////////////////////////////////////////////////
/// Event and Mixins
/// ////////////////////////////////////////////////////////////////////
@Freezed(
  copyWith: false,
  equal: false,
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions(maybeMap: false, mapOrNull: false),
  fromJson: false,
  toJson: false,
)
class SupportDataEvent with _$SupportDataEvent {
  const factory SupportDataEvent.updateActivableFields(
    List<ActivableAddCaseField> fields,
  ) = _UpdateActivableField;

  const factory SupportDataEvent.updateAnesthesiaBlocks(
    List<String> blocks,
  ) = _UpdateAnesthesiaBlock;

  const factory SupportDataEvent.updateAssistants(
    List<AssistantModel> assistantModels,
  ) = _UpdateAssistants;

  const factory SupportDataEvent.addAssistant(
    AssistantModel assistantModel,
  ) = _AddAssistants;

  const factory SupportDataEvent.addSurgeryLocation(
    SurgeryLocationModel surgeryLocationModel,
  ) = _AddSurgeryLocation;

  const factory SupportDataEvent.updateSurgeryLocations(
    List<SurgeryLocationModel> surgeryLocations,
  ) = _UpdateSurgeryLocations;
}

mixin class SupportDataEventMixin {}

mixin class SupportDataStateMixin {
  SupportDataModel supportDataModel(WidgetRef ref) => ref.watch(
        supportDataNotifierProvider,
      );

  List<String> anesthesiaBlocks(WidgetRef ref) => ref.watch(
        supportDataNotifierProvider
            .select((value) => value.anesthesiaBlocks ?? []),
      );

  List<ActivableAddCaseField> activableAddCaseFields(WidgetRef ref) {
    final fieldList = ref.watch(
      supportDataNotifierProvider.select((value) => value.activeBasicFields),
    );

    //if (fieldList == null) return ActivableAddCaseField.values;

    return fieldList
        .map((name) => ActivableAddCaseField.values.byName(name))
        .toList();
  }
}
