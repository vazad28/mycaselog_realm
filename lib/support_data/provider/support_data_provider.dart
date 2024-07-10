import 'dart:async';

import 'package:app_extensions/app_extensions.dart';
import 'package:app_models/app_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';
import '../../core/services/services.dart';
import '../support_data.dart';

part '../../generated/support_data/provider/support_data_provider.freezed.dart';
part '../../generated/support_data/provider/support_data_provider.g.dart';
part './support_data_mixin.dart';

/// ////////////////////////////////////////////////////////////////////
/// Main providers
/// ////////////////////////////////////////////////////////////////////
@riverpod
class SupportDataNotifier extends _$SupportDataNotifier with LoggerMixin {
  @override
  SupportDataModel build() {
    final userID = ref.watch(authenticationUserProvider).id;

    final sub = ref
        .watch(dbProvider)
        .supportDataCollection
        .getSingleStream('userID', userID)
        .listen((data) {
      if (data.results.isEmpty) return;
      state = SupportDataModelX.fromJson(data.results.single.toJson());
    });

    ref.onDispose(sub.cancel);

    return SupportDataModelX.zero(userID);
  }

  Future<void> _updateSupportData(
    SupportDataModel supportDataModel,
  ) async {
    try {
      await ref.watch(dbProvider).supportDataCollection.put(
            ref.watch(authenticationUserProvider).id,
            supportDataModel.toRealmObject(),
          );
    } catch (err) {
      ref.watch(dialogServiceProvider).showSnackBar(err.toString());
    }
  }

  ///
  /// Map events to state
  Future<void> on(SupportDataEvent event) async {
    event.map(
      updateAnesthesiaBlocks: (value) {
        _updateSupportData(state..anesthesiaBlocks = value.blocks.toRealmList);
      },
      updateAssistants: (value) {
        _updateSupportData(
            state..assistants = value.assistantModels.toRealmList,);
      },
      addAssistant: (value) {
        _onAddAssistant(value.assistantModel);
      },
      updateSurgeryLocations: (value) {
        _updateSupportData(
          state..surgeryLocations = value.surgeryLocations.toRealmList,
        );
      },
      addSurgeryLocation: (value) {
        _onAddSurgeryLocation(value.surgeryLocationModel);
      },
      updateActivableFields: (value) {
        _updateSupportData(
          state..activeBasicFields = value.fields.names.toRealmList,
        );
      },
    );
  }

  // /// Put assistant
  void _onAddAssistant(AssistantModel assistantModel) {
    final assistants = List<AssistantModel>.from(state.assistants);
    final index = assistants.indexWhere(
      (element) => element.assistantID == assistantModel.assistantID,
    );

    if (index == -1) {
      assistants.add(assistantModel);
    } else {
      assistants[index] = assistantModel;
    }

    _updateSupportData(state..assistants = assistants.toRealmList);
  }

  /// On suregry location model update
  void _onAddSurgeryLocation(SurgeryLocationModel surgeryLocation) {
    final locations = List<SurgeryLocationModel>.from(
      state.surgeryLocations,
    );
    final index = locations.indexWhere(
      (element) => element.locationID == surgeryLocation.locationID,
    );
    if (index == -1) {
      locations.add(surgeryLocation);
    } else {
      locations[index] = surgeryLocation;
    }

    _updateSupportData(state = state..surgeryLocations = locations.toRealmList);
  }

  // ignore: unused_element
  // void _onPutPcp(PcpModel pcpModel) {
  //   final pcps = List<PcpModel>.from(state.pcps ?? <PcpModel>[]);
  //   final index = pcps.indexWhere((element) => element.pcpID == pcpModel.pcpID);
  //   if (index == -1) {
  //     pcps.add(pcpModel);
  //   } else {
  //     if (pcpModel.removed == 1) {
  //       pcps.removeAt(index);
  //     } else {
  //       pcps[index] = pcpModel;
  //     }
  //   }

  //   _updateSupportData(state.copyWith(pcps: [pcpModel]));
  // }

  // ignore: unused_element
  void _onPutAnesthesiaBlock(String block) {
    final blocks = List<String>.from(state.anesthesiaBlocks ?? []);
    if (blocks.contains(block)) {
      blocks.remove(block);
    } else {
      blocks.add(block);
    }

    _updateSupportData(state..anesthesiaBlocks = blocks.toRealmList);
  }

  void load() {}
}
