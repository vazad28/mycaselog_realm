// import 'package:app_annotations/app_annotations.dart';
// import 'package:app_extensions/app_extensions.dart';
// import 'package:app_models/app_models.dart';
// import 'package:app_repositories/app_repositories.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:realm/realm.dart';

// import '../../core/providers/providers.dart';

// mixin SupportDataMixin {
//   void updateActivableCaseFields(
//     WidgetRef ref, {
//     ActivableCaseField? field,
//     bool reset = false,
//   }) {
//     final collection = ref.watch(collectionsProvider).supportDataCollection;
//     final supportData = collection.getSupportData();

//     if (field != null) {
//       collection.upsert(supportData.userID, () {
//         return supportData
//           ..activeBasicFields.replaceOrAdd(field.name)
//           ..timestamp = ModelUtils.getTimestamp;
//       });
//     } else if (reset) {
//       collection.upsert(supportData.userID, () {
//         return supportData
//           ..activeBasicFields.clear()
//           ..timestamp = ModelUtils.getTimestamp;
//       });
//     } else {
//       throw Exception('updateActivableCaseFields failed');
//     }
//   }

//   RealmList<String> anesthesiaBlocksList(WidgetRef ref) {
//     return ref.watch(
//       supportDataProvider.select(
//         (data) => data.value?.anesthesiaBlocks ?? RealmList<String>([]),
//       ),
//     );
//   }

//   Future<void> upsertAnesthesiaBlock(
//       WidgetRef ref, String block, CrudAction crudAction,
//       {String? oldItem}) async {
//     ref.watch(realmProvider).write(() {
//       RealmList<String> anesthesiaList = anesthesiaBlocksList(ref);
//       if (crudAction == CrudAction.remove) {
//         anesthesiaList.remove(block);
//       } else if (crudAction == CrudAction.add) {
//         anesthesiaList.add(block);
//       } else {
//         if (oldItem == null) return;
//         anesthesiaList
//           ..remove(oldItem)
//           ..add(block);
//       }
//     });
//   }

//   /// ////////////////////////////////////////////////////////////////////
//   /// Assistants
//   /// ////////////////////////////////////////////////////////////////////
//   RealmList<AssistantModel> assistantsList(WidgetRef ref) {
//     return ref.watch(
//       supportDataProvider.select(
//         (data) => data.value?.assistants ?? RealmList<AssistantModel>([]),
//       ),
//     );
//   }

//   Future<void> upsertAssistant(
//       WidgetRef ref, AssistantModel assistantModel, CrudAction crudAction,
//       {AssistantModel? oldItem}) async {
//     ref.watch(realmProvider).write(() {
//       final assistants = assistantsList(ref);
//       if (crudAction == CrudAction.remove) {
//         assistants.remove(assistantModel);
//       } else if (crudAction == CrudAction.add) {
//         assistants.add(assistantModel);
//       } else {
//         if (oldItem != null) {
//           oldItem
//             ..name = assistantModel.name
//             ..phone = assistantModel.phone;
//         }
//       }
//       final collection = ref.watch(collectionsProvider).supportDataCollection;
//       final supportData = collection.getSupportData();
//       return supportData..timestamp = ModelUtils.getTimestamp;
//     });
//   }
// }
