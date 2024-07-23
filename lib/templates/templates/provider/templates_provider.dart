import 'package:app_models/app_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers/providers.dart';

part '../../../generated/templates/templates/provider/templates_provider.g.dart';

/// ////////////////////////////////////////////////////////////////////
/// Main Provider
/// ////////////////////////////////////////////////////////////////////
/// Flag to show only active templates or all templates
final showActiveTemplatesProvider =
    StateProvider.autoDispose<bool>((ref) => true);

@riverpod
Stream<Iterable<TemplateModel>> templatesStream(TemplatesStreamRef ref) {
  final showActiveOnly = ref.watch(showActiveTemplatesProvider);

  return ref
      .read(collectionsProvider)
      .templatesCollection
      .getAll()
      .changes
      .asyncMap((data) {
    return showActiveOnly
        ? data.results.where((e) => e.removed == 0)
        : data.results.where((e) => e.removed == 1);
  });
}

// @riverpod
// class TemplatesList extends _$TemplatesList {
//   final scrollController = ScrollController();

//   @override
//   List<TemplateModel> build() {
//     final sub = ref
//         .watch(collectionsProvider)
//         .templatesCollection
//         .getAll()
//         .changes
//         .listen((data) {
//       state =
//           data.results.map((e) => TemplateModelX.fromJson(e.toJson())).toList();
//     });

//     ref.onDispose(sub.cancel);

//     return <TemplateModel>[];
//   }

//   Future<void> _updateTemplate(TemplateModel templateModel) async {
//     await ref.watch(collectionsProvider).templatesCollection.add(
//           ref.watch(authenticationUserProvider).id,
//           templateModel,
//         );
//   }

//   /// Map events to state
//   Future<void> on(TemplatesEvent event) async {
//     await event.map(
//       deactivateTemplate: (value) =>
//           _updateTemplate(value.templateModel..removed = 2),
//       deleteTemplate: (value) =>
//           _updateTemplate(value.templateModel..removed = 1),
//       reactivateTemplate: (value) =>
//           _updateTemplate(value.templateModel..removed = 0),
//       shareTemplate: (value) =>
//           _updateTemplate(value.templateModel..shared = true),
//       unShareTemplate: (value) =>
//           _updateTemplate(value.templateModel..shared = false),
//     );
//   }
// }
