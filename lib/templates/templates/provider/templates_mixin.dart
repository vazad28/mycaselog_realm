// import 'package:app_models/app_models.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../core/core.dart';

// enum TemplateEvent { deactivate, delete, reactivate, share, unShare }

// mixin TemplateMixin {
//   Future<void> updateTemplate(
//     WidgetRef ref,
//     TemplateModel templateModel,
//     TemplateEvent event,
//   ) {
//     return ref.watch(dbProvider).templatesCollection.upsert(
//       templateModel.templateID,
//       () {
//         return switch (event) {
//           TemplateEvent.share => templateModel..shared = true,
//           TemplateEvent.deactivate => templateModel..removed = 2,
//           TemplateEvent.delete => templateModel..removed = 1,
//           TemplateEvent.reactivate => templateModel..removed = 0,
//           TemplateEvent.unShare => templateModel..shared = false,
//         };
//       },
//     );
//   }
// }
