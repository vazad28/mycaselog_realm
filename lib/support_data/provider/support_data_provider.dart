import 'dart:async';

import 'package:app_annotations/app_annotations.dart';
import 'package:app_extensions/app_extensions.dart';
import 'package:app_models/app_models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';

part '../../generated/support_data/provider/support_data_provider.g.dart';

@riverpod
class SupportDataNotifier extends _$SupportDataNotifier {
  @override
  SupportDataModel build() {
    final userID = ref.watch(authenticationUserProvider).id;

    final sub = ref
        .watch(dbProvider)
        .supportDataCollection
        .getAll()
        .changes
        .listen((data) {
      if (data.results.isNotEmpty) state = data.results.last.toUnmanaged();
    });

    ref.onDispose(sub.cancel);

    return SupportDataModelX.zero(userID);
  }

  Future<void> _updateSupportData(SupportDataModel supportDataModel) async {
    try {
      await ref.watch(dbProvider).supportDataCollection.upsert(
            () => supportDataModel..timestamp = ModelUtils.getTimestamp,
          );
    } catch (err) {
      ref.watch(dialogServiceProvider).showSnackBar(err.toString());
    }
  }

  void upsertAnesthesiaBlock(String block, CrudAction action) {
    if (action == CrudAction.delete) {
      _updateSupportData(state..anesthesiaBlocks.remove(block));
    } else {
      _updateSupportData(state..anesthesiaBlocks.replaceOrAdd(block));
    }
  }

  void upsertAssistant(AssistantModel model, CrudAction action) {
    ref
        .watch(crudProvider.notifier)
        .crud<AssistantModel>(model, action)
        .then((_) {
      _updateSupportData(state);
    });
  }

  void upsertSurgeryLocation(SurgeryLocationModel model, CrudAction action) {
    ref
        .watch(crudProvider.notifier)
        .crud<SurgeryLocationModel>(model, action)
        .then((_) {
      _updateSupportData(state);
    });
  }

  void upsertActivableCaseFields(List<ActivableCaseField>? fields) {
    if (fields == null) {
      _updateSupportData(state..activeBasicFields.clear());
      return;
    }
    state.activeBasicFields.clear();
    _updateSupportData(
      state..activeBasicFields.addAll(fields.names.toRealmList),
    );
  }
}
