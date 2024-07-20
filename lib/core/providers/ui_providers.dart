import 'package:app_annotations/app_annotations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../support_data/support_data.dart';

part '../../generated/core/providers/ui_providers.g.dart';

@riverpod
List<ActivableCaseField> activeFieldsList(ActiveFieldsListRef ref) {
  final list = ref.watch(
    supportDataNotifierProvider.select(
      (data) => data.activeBasicFields
          .map((name) => ActivableCaseField.values.byName(name))
          .toList(),
    ),
  );

  if (list.isEmpty) return ActivableCaseField.values;
  return list;
}

// @riverpod
// Stream<SupportDataModel> supportData(SupportDataRef ref) async* {
//   final changes = ref
//       .watch(collectionsProvider)
//       .supportDataCollection
//       .getSupportData()
//       .changes;

//   // ignore: curly_braces_in_flow_control_structures
//   await for (final model in changes) yield model.object;
// }

// @riverpod
// Stream<List<ActivableCaseField>> activableCaseField(
//   ActivableCaseFieldRef ref,
// ) async* {
//   final stream = ref
//       .watch(collectionsProvider)
//       .supportDataCollection
//       .getSupportData()
//       .activeBasicFields
//       .changes;

//   await for (final fields in stream) {
//     final fieldsList = fields.list;
//     if (fieldsList.isEmpty) yield ActivableCaseField.values;

//     yield fieldsList
//         .map((name) => ActivableCaseField.values.byName(name))
//         .toList();
//   }
// }
