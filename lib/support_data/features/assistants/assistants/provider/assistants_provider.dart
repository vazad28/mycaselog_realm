import 'package:app_extensions/app_extensions.dart';
import 'package:app_models/app_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../support_data.dart';

part '../../../../../generated/support_data/features/assistants/assistants/provider/assistants_provider.freezed.dart';
part '../../../../../generated/support_data/features/assistants/assistants/provider/assistants_provider.g.dart';

/// ////////////////////////////////////////////////////////////////////
/// MIXINS
/// ////////////////////////////////////////////////////////////////////
@Freezed(
  copyWith: false,
  equal: false,
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions(maybeMap: false, mapOrNull: false),
)
class AssistantsEvent with _$AssistantsEvent {
  const factory AssistantsEvent.filterAssistants() = _OnFilter;
}

mixin AssistantsEventMixin {
  void filterAssistants(WidgetRef ref, String filterText) => ref
      .watch(assitantFilterTextProvider.notifier)
      .update((state) => filterText);

  void updateAssistant(WidgetRef ref, AssistantModel assistantModel) {
    final assistants =
        List<AssistantModel>.from(ref.read(assistantsListProvider));

    final index = assistants.indexWhere(
      (element) => element.assistantID == assistantModel.assistantID,
    );

    if (index != -1) {
      assistants[index] = assistantModel;
    } else {
      assistants.add(assistantModel);
    }
    ref
        .watch(supportDataNotifierProvider.notifier)
        .on(SupportDataEvent.updateAssistants(assistants));
  }
}

mixin AssistantsStateMixin {
  List<AssistantModel> assistantsListState(WidgetRef ref) =>
      ref.watch(filteredAssistantsListProvider);
}

/// ////////////////////////////////////////////////////////////////////
/// Providers
/// ////////////////////////////////////////////////////////////////////
/// state  provider for filter text
final assitantFilterTextProvider =
    StateProvider.autoDispose<String?>((ref) => null);

/// Provider to keep the state of Assistants
@riverpod
List<AssistantModel> assistantsList(AssistantsListRef ref) {
  final assistants = ref.watch(
    supportDataNotifierProvider.select(
      (value) =>
          value.assistants.where((element) => element.removed == 0).toList(),
    ),
  );

  return assistants ?? [];
}

/// Provider to filter assistants
@riverpod
List<AssistantModel> filteredAssistantsList(FilteredAssistantsListRef ref) {
  final filterText = ref.watch(assitantFilterTextProvider);
  final assistantsList = ref.watch(assistantsListProvider);

  return (filterText?.isEmpty ?? true)
      ? assistantsList.where((o) => o.removed == 0).toList()
      : assistantsList
          .where(
            (o) =>
                o.removed == 0 &&
                (o.name?.containsIgnoreCaseSIS(filterText!) ?? false),
          )
          .toList();
}
