import 'dart:async';

import 'package:app_annotations/app_annotations.dart';
import 'package:app_extensions/app_extensions.dart';
import 'package:app_models/app_models.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';
import '../../core/services/services.dart';

part '../../generated/support_data/provider/support_data_provider.g.dart';

/// ////////////////////////////////////////////////////////////////////
/// Main providers
/// ////////////////////////////////////////////////////////////////////
@riverpod
class SupportDataNotifier extends _$SupportDataNotifier with LoggerMixin {
  @override
  SupportDataModel build() {
    final userID = ref.watch(authenticationUserProvider).id;

    final sub = ref
        .watch(collectionsProvider)
        .supportDataCollection
        .getSingle(userID)
        ?.changes
        .listen((data) {
      state = SupportDataModelX.fromJson(data.object.toJson());
    });

    ref.onDispose(() => sub?.cancel());

    return SupportDataModelX.zero(userID);
  }

  Future<void> _updateSupportData() async {
    try {
      final userID = ref.watch(authenticationUserProvider).id;
      await ref
          .watch(collectionsProvider)
          .supportDataCollection
          .add(userID, state..timestamp = ModelUtils.getTimestamp);
    } catch (err) {
      ref.watch(dialogServiceProvider).showSnackBar(err.toString());
    }
  }

  /// On suregry location model update
  Future<void> upsertSurgeryLocation(SurgeryLocationModel surgeryLocation,
      {bool remove = false}) {
    final surgeryLocations = List<SurgeryLocationModel>.from(
      state.surgeryLocations,
    );
    final index = surgeryLocations.indexWhere(
      (element) => element.locationID == surgeryLocation.locationID,
    );

    if (remove) {
      surgeryLocations.removeAt(index);
    } else if (index == -1) {
      surgeryLocations.add(surgeryLocation);
    } else {
      surgeryLocations[index] = surgeryLocation;
    }

    state.surgeryLocations.clear();
    state.surgeryLocations.addAll(surgeryLocations);
    return _updateSupportData();
  }

  Future<void> upsertAssistant(AssistantModel assistantModel,
      {bool remove = false}) {
    final assistants = List<AssistantModel>.from(state.assistants);
    final index = assistants.indexWhere(
      (element) => element.assistantID == assistantModel.assistantID,
    );

    if (remove) {
      assistants.removeAt(index);
    } else if (index == -1) {
      assistants.add(assistantModel);
    } else {
      assistants[index] = assistantModel;
    }

    state.assistants.clear();
    state.assistants.addAll(assistants);
    return _updateSupportData();
  }

  Future<void> upsertActivableCaseFields(List<ActivableCaseField>? fields) {
    state.activeBasicFields.clear();
    if (fields != null) {
      state.activeBasicFields.addAll(fields.names);
    }
    return _updateSupportData();
  }

  Future<void> upsertAnesthesiaBlocks(List<String> blocks, {bool add = false}) {
    if (add) {
      state.anesthesiaBlocks.add(blocks.first);
    } else {
      state.anesthesiaBlocks.clear();
      state.anesthesiaBlocks.addAll(blocks);
    }
    return _updateSupportData();
  }
}
