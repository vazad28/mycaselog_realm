part of 'templates_provider.dart';

// mixin TemplatesEventMixin {
//   void onTemplateTap(WidgetRef ref, TemplatesEvent e) {
//     final notifier = ref.watch(templatesNotifierProvider.notifier);
//     e.map(
//       deactivateTemplate: (v) =>
//           notifier.on(TemplatesEvent.deactivateTemplate(v.templateModel)),
//       deleteTemplate: (v) =>
//           notifier.on(TemplatesEvent.deleteTemplate(v.templateModel)),
//       reactivateTemplate: (v) =>
//           notifier.on(TemplatesEvent.reactivateTemplate(v.templateModel)),
//       shareTemplate: (v) =>
//           notifier.on(TemplatesEvent.shareTemplate(v.templateModel)),
//       unShareTemplate: (v) =>
//           notifier.on(TemplatesEvent.unShareTemplate(v.templateModel)),
//     );
//   }

//   void showHideActiveTemplate(WidgetRef ref) =>
//       ref.watch(showActiveTemplatesProvider.notifier).update((cb) => !cb);
// }

// mixin TemplatesStateMixin {
//   StateOf<List<TemplateModel>> stateOfTemplates(WidgetRef ref) =>
//       ref.watch(templatesNotifierProvider);

//   bool showActiveTemplatesOnly(WidgetRef ref) =>
//       ref.watch(showActiveTemplatesProvider);

//   /// scroll controller for list view
//   ScrollController templatesListScrollController(WidgetRef ref) => ref
//       .watch(templatesNotifierProvider.notifier)
//       .templatesListScrollController;
// }
