// import 'package:app_ui/app_ui.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../core/core.dart';
// import '../templates.dart';

// ///
// /// List of templates for the main screen
// ///
// /// We pass the scroll controller to the list view
// /// The controller allows the FAB button respond to the scrolling of the list
// ///
// class TemplatesView extends ConsumerWidget {
//   const TemplatesView({required this.scrollController, super.key});

//   final ScrollController scrollController;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return AsyncValueWidget(
//         value: ref.watch(templatesStreamProvider),
//         data: (templateModels) {
//           return ListView.builder(
//             controller: scrollController,
//             padding: const EdgeInsets.all(AppSpacing.md),
//             itemCount: templateModels.length,
//             itemBuilder: (_, index) => TemplatesListTile(
//               templateModel: templateModels.elementAt(index),
//             ).paddingOnly(bottom: AppSpacing.md),
//           );
//         });
//   }
// }
