import 'dart:async';

import 'package:app_extensions/app_extensions.dart';
import 'package:app_models/app_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_client/logger_client.dart';
import 'package:realm/realm.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/providers/providers.dart';
import '../../core/realm/realm_config.dart';
import '../../core/services/services.dart';
import '../support_data.dart';

part '../../generated/support_data/provider/support_data_provider.freezed.dart';
part '../../generated/support_data/provider/support_data_provider.g.dart';

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

/// ////////////////////////////////////////////////////////////////////
/// Main providers
/// ////////////////////////////////////////////////////////////////////
@Riverpod(keepAlive: true)
class SupportDataNotifier extends _$SupportDataNotifier with LoggerMixin {
  StreamSubscription<List<SupportDataModel>>? subscription;

  @override
  SupportDataModel build() {
    final authenticationUser = ref.watch(authenticationUserProvider);
    final realm = ref.read(realmProvider);

    final collection = ref.watch(databaseServiceProvider).supportDataCollection;

    subscription = collection.listenForChanges().listen((documents) {
      // Handle document changes (added, modified)
      print('new SupportDataModel should be painted');
    });

    ref.onDispose(() {
      logger.fine('cases notifier dispose called');
      subscription?.cancel();
    });

    return realm.find<SupportDataModel>(authenticationUser.id) ??
        SupportDataModelX.zero(authenticationUser.id);
  }

  void _updateSupportData(
    SupportDataModel supportDataModel,
  ) {
    try {
      ref
          .read(databaseServiceProvider)
          .supportDataCollection
          .put(supportDataModel.userID ?? 'annonymous', supportDataModel);

      state = supportDataModel;
    } catch (err) {
      ref.watch(dialogServiceProvider).showSnackBar(err.toString());
    }
  }

  ///
  /// Map events to state
  Future<void> on(SupportDataEvent event) async {
    event.map(
      updateAnesthesiaBlocks: (value) {
        _updateSupportData(
            state..anesthesiaBlocks = RealmList<String>(value.blocks));
      },
      updateAssistants: (value) {
        _updateSupportData(state
          ..assistants = RealmList<AssistantModel>(value.assistantModels));
      },
      addAssistant: (value) {
        _onAddAssistant(value.assistantModel);
      },
      updateSurgeryLocations: (value) {
        _updateSupportData(
          state
            ..surgeryLocations =
                RealmList<SurgeryLocationModel>(value.surgeryLocations),
        );
      },
      addSurgeryLocation: (value) {
        _onAddSurgeryLocation(value.surgeryLocationModel);
      },
      updateActivableFields: (value) {
        _updateSupportData(
          state..activeBasicFields = RealmList<String>(value.fields.names),
        );
      },
      // putPcp: (value) {
      //   _onPutPcp(value.pcpModel);
      // },
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

    _updateSupportData(
        state..assistants = RealmList<AssistantModel>(assistants));
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

    _updateSupportData(state = state
      ..surgeryLocations = RealmList<SurgeryLocationModel>(locations));
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
    final blocks = List<String>.from(state.anesthesiaBlocks);
    if (blocks.contains(block)) {
      blocks.remove(block);
    } else {
      blocks.add(block);
    }

    _updateSupportData(state..anesthesiaBlocks = RealmList<String>(blocks));
  }
}
