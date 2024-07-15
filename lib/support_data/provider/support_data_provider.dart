import 'dart:async';

import 'package:app_extensions/app_extensions.dart';
import 'package:app_models/app_models.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';
import '../../core/services/services.dart';
import '../support_data.dart';

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

  Future<void> _updateSupportData() async {
    try {
      await ref.watch(dbProvider).supportDataCollection.put(
            ref.watch(authenticationUserProvider).id,
            state.toRealmObject(),
          );
    } catch (err) {
      ref.watch(dialogServiceProvider).showSnackBar(err.toString());
    }
  }

  /// On suregry location model update
  Future<void> upsertSurgeryLocation(SurgeryLocationModel surgeryLocation) {
    final surgeryLocations = List<SurgeryLocationModel>.from(
      state.surgeryLocations,
    );
    final index = surgeryLocations.indexWhere(
      (element) => element.locationID == surgeryLocation.locationID,
    );
    if (index == -1) {
      surgeryLocations.add(surgeryLocation);
    } else {
      surgeryLocations[index] = surgeryLocation;
    }

    state.surgeryLocations.clear();
    state.surgeryLocations.addAll(surgeryLocations);
    return _updateSupportData();
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
  Future<void> upsertPutAnesthesiaBlock(String block) {
    final blocks = List<String>.from(state.anesthesiaBlocks);
    if (blocks.contains(block)) {
      blocks.remove(block);
    } else {
      blocks.add(block);
    }

    return _updateSupportData();
  }

  Future<void> upsertAssistant(AssistantModel assistantModel) {
    final assistants = List<AssistantModel>.from(state.assistants);
    final index = assistants.indexWhere(
      (element) => element.assistantID == assistantModel.assistantID,
    );

    if (index == -1) {
      assistants.add(assistantModel);
    } else {
      assistants[index] = assistantModel;
    }

    state.assistants.clear();
    state.assistants.addAll(assistants);
    return _updateSupportData();
  }

  Future<void> upsertActivableFields(List<ActivableAddCaseField> fields) {
    state.activeBasicFields.clear();
    state.activeBasicFields.addAll(fields.names);
    return _updateSupportData();
  }

  Future<void> upsertAnesthesiaBlock(String block) {
    state.anesthesiaBlocks.replaceOrAdd(block);
    return _updateSupportData();
  }
}
