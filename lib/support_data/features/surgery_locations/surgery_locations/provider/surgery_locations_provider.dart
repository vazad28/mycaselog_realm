import 'package:app_extensions/app_extensions.dart';
import 'package:app_models/app_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../support_data.dart';

part '../../../../../generated/support_data/features/surgery_locations/surgery_locations/provider/surgery_locations_provider.freezed.dart';
part '../../../../../generated/support_data/features/surgery_locations/surgery_locations/provider/surgery_locations_provider.g.dart';

/// ////////////////////////////////////////////////////////////////////
/// Event and Mixins
/// ////////////////////////////////////////////////////////////////////
@Freezed(
  copyWith: false,
  equal: false,
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions(maybeMap: false, mapOrNull: false),
)
class SurgeryLocationsEvent with _$SurgeryLocationsEvent {
  const factory SurgeryLocationsEvent.filterSurgeryLocations() =
      _FilterSurgeryLocations;
}

mixin SurgeryLocationsEventMixin {
  void filterSurgeryLocations(WidgetRef ref, String filterText) => ref
      .watch(surgeryLocationFilterTextProvider.notifier)
      .update((state) => filterText);

  void updateSurgeryLocation(
    WidgetRef ref,
    SurgeryLocationModel surgeryLocationModel,
  ) {
    final surgeryLocations =
        List<SurgeryLocationModel>.from(ref.read(surgeryLocationsListProvider));

    final index = surgeryLocations.indexWhere(
      (element) => element.locationID == surgeryLocationModel.locationID,
    );

    if (index != -1) {
      surgeryLocations[index] = surgeryLocationModel;
    } else {
      surgeryLocations.add(surgeryLocationModel);
    }

    ref
        .watch(supportDataNotifierProvider.notifier)
        .on(SupportDataEvent.updateSurgeryLocations(surgeryLocations));
  }
}

mixin SurgeryLocationsStateMixin {
  List<SurgeryLocationModel> surgeryLocationsListState(WidgetRef ref) =>
      ref.watch(filteredSurgeryLocationsListProvider);
}

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////
/// state  provider for filter text
final surgeryLocationFilterTextProvider =
    StateProvider.autoDispose<String?>((ref) => null);

/// Provider to keep the state of Assistants
@riverpod
List<SurgeryLocationModel> surgeryLocationsList(SurgeryLocationsListRef ref) {
  final surgeryLocations = ref.watch(
    supportDataNotifierProvider.select(
      (value) => value.surgeryLocations
          .where((element) => element.removed == 0)
          .toList(),
    ),
  );

  return surgeryLocations;
}

/// Provider to filter surgeryLocations
@riverpod
List<SurgeryLocationModel> filteredSurgeryLocationsList(
  FilteredSurgeryLocationsListRef ref,
) {
  final filterText = ref.watch(surgeryLocationFilterTextProvider);
  final surgeryLocationsList = ref.watch(surgeryLocationsListProvider);

  return (filterText?.isEmpty ?? true)
      ? surgeryLocationsList.where((o) => o.removed == 0).toList()
      : surgeryLocationsList
          .where(
            (o) =>
                o.removed == 0 &&
                (o.name?.containsIgnoreCaseSIS(filterText!) ?? false),
          )
          .toList();
}
