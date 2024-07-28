// import 'dart:async';

// import 'package:app_annotations/app_annotations.dart';
// import 'package:app_extensions/app_extensions.dart';
// import 'package:app_models/app_models.dart';
// import 'package:logger_client/logger_client.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';

// import '../../core/providers.dart';
// import '../../core/app_services.dart';

// part '../../generated/support_data/provider/support_data_provider.g.dart';

// /// ////////////////////////////////////////////////////////////////////
// /// Main providers
// /// ////////////////////////////////////////////////////////////////////
// @riverpod
// class SupportDataNotifier extends _$SupportDataNotifier with LoggerMixin {
//   @override
//   SupportDataModel build() {
//     return ref
//         .watch(dbProvider)
//         .supportDataCollection
//         .getSupportData()
//         .toUnmanaged();
//     // final userID = ref.watch(authenticationUserProvider).id;

//     // final sub = ref
//     //     .watch(dbProvider)
//     //     .supportDataCollection
//     //     .getAll()
//     //     .changes
//     //     .listen((data) {
//     //   state = data.results.last;
//     // });

//     // ref.onDispose(sub.cancel);

//     // return SupportDataModelX.zero(userID);
//   }

//   Future<void> updateSupportData(
//       SupportDataModel Function(SupportDataModel) updateCallback) async {
//     state = updateCallback.call(state);
//   }

//   Future<void> _updateSupportData() async {
//     try {
//       final userID = ref.watch(authenticationUserProvider).id;
//       await ref.watch(dbProvider).supportDataCollection.update(
//             userID,
//             (model) => model..timestamp = ModelUtils.getTimestamp,
//           );
//     } catch (err) {
//       ref.watch(dialogServiceProvider).showSnackBar(err.toString());
//     }
//   }

//   /// On suregry location model update
//   void upsertSurgeryLocation(
//       SurgeryLocationModel surgeryLocation, CrudAction action) {
//     ref
//         .watch(crudProvider.notifier)
//         .upsert<SurgeryLocationModel>(surgeryLocation, action)
//         .then((updatedData) {
//       _updateSupportData();
//     });
//   }

//   void upsertAssistant(AssistantModel assistantModel, CrudAction action) {
//     ref
//         .watch(crudProvider.notifier)
//         .upsert<AssistantModel>(assistantModel, action)
//         .then((_) {
//       _updateSupportData();
//     });
//   }

//   void upsertAnesthesiaBlock(String value, CrudAction action) {
//     final newList = ref
//         .watch(crudProvider.notifier)
//         .upsertRealmList<String>(state.anesthesiaBlocks, value, action);
//     print(newList);

//     _updateSupportData();
//   }

//   void upsertActivableCaseFields(List<ActivableCaseField>? fields) {
//     state.activeBasicFields.clear();
//     if (fields != null) {
//       state.activeBasicFields.addAll(fields.names);
//     }
//     _updateSupportData();
//   }

//   // void upsertAnesthesiaBlock(String value, CrudAction action) {
//   //   final anesthesiaList = List<String>.from(state.anesthesiaBlocks);
//   //   if (action == CrudAction.remove) {
//   //     anesthesiaList.remove(value);
//   //   } else {
//   //     anesthesiaList.replaceOrAdd(value);
//   //   }
//   //   ref.watch(dbProvider).supportDataCollection.update(state.userID, () {
//   //     state.anesthesiaBlocks.clear();
//   //     state.anesthesiaBlocks.addAll(anesthesiaList);
//   //     return state;
//   //   });
//   // }
// }
