part of '../view/add_note_page.dart';

// class NoteAppBar extends ConsumerWidget implements PreferredSizeWidget {
//   const NoteAppBar({
//     required this.controller,
//     required this.focusNode,
//     super.key,
//   });

//   final QuillController controller;
//   final FocusNode focusNode;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return AppBar(
//       leading: focusNode.hasFocus
//           ? _SubmitButton(controller: controller)
//           : const BackButton(),
//       title: QuillToolbar(
//         // ignore: avoid_redundant_argument_values
//         configurations: const QuillToolbarConfigurations(),
//         child: Row(
//           children: [
//             QuillToolbarHistoryButton(
//               isUndo: true,
//               controller: controller,
//             ),
//             QuillToolbarHistoryButton(
//               isUndo: false,
//               controller: controller,
//             ),
//           ],
//         ),
//       ),
//       actions: [
//         _MenuAnchor(
//           controller: controller,
//         ),
//       ],
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }

/// ////////////////////////////////////////////////////////////////////
/// Submit button
/// ////////////////////////////////////////////////////////////////////
// class _SubmitButton extends ConsumerWidget{
//   const _SubmitButton({required this.controller});

//   final QuillController controller;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     //final status = formSubmitStatus(ref);

//     return status.maybeWhen(
//       loading: (_) => IconButton(
//         onPressed: () => {},
//         icon: const Spinner(),
//       ),
//       orElse: () => IconButton(
//         icon: const Icon(Icons.check),
//         onPressed: () {
//           submit(ref);
//         },
//       ),
//     );
//   }
// }

// class _MenuAnchor extends ConsumerWidget {
//   const _MenuAnchor({required this.controller});

//   final QuillController controller;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return MenuAnchor(
//       builder: (context, controller, child) {
//         return IconButton(
//           onPressed: () {
//             if (controller.isOpen) {
//               controller.close();
//               return;
//             }
//             controller.open();
//           },
//           icon: const Icon(
//             Icons.more_vert,
//           ),
//         );
//       },
//       menuChildren: [
//         MenuItemButton(
//           onPressed: () async {
//             final pdfDocument = pw.Document();
//             final pdfWidgets = await controller.document.toDelta().toPdf();
//             pdfDocument.addPage(
//               pw.MultiPage(
//                 maxPages: 200,
//                 pageFormat: PdfPageFormat.a4,
//                 build: (context) {
//                   return pdfWidgets;
//                 },
//               ),
//             );
//             await Printing.layoutPdf(
//               onLayout: (format) async => pdfDocument.save(),
//             );
//           },
//           child: const Text('Print as PDF'),
//         ),
//       ],
//     );
//   }
// }
