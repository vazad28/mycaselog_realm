part of '../database_section.dart';

/// Import database settings tile
class DatabaseIoTile extends StatelessWidget {
  const DatabaseIoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      title: 'Database Import/Export',
      subTitle: 'Import/Export database from/to a file',
      leading: const Icon(Icons.label_important_rounded),
      onTap: () async {
        // return showModalBottomSheet(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return _ExportBottomSheet();
        //   },
        // );
        await showModalBottomSheet<DatabaseIoPage>(
          context: context,
          //isDismissible: false,
          enableDrag: true,
          builder: (_) => const DatabaseIoPage(),
        );
      },
    );
  }
}

// class _ExportBottomSheet extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final exportState = ref.watch(realmExportProvider);

//     final child = Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ...exportState.maybeWhen(
//             success: (value) => [
//               Text(
//                 'Database export created successfully'.hardcoded,
//               ),
//               VerticalSpacer.large,
//               AppButton(
//                 onPressed: notifier.shareExportedDatabaseFile,
//                 child: const Text('Share Exported File'),
//               ),
//             ],
//             failure: (err) => [
//               Text(
//                 err.toLocalizedString().hardcoded,
//                 textAlign: TextAlign.center,
//                 style: Theme.of(context).textTheme.bodyLarge,
//               ),
//             ],
//             orElse: () => [
//               Loading(
//                 text: 'creating export data..'.hardcoded,
//                 showSpinner: true,
//               ),
//             ],
//           )
//         ]);

//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Align(
//           alignment: Alignment.topLeft,
//           child: BackButton(
//             onPressed: onCancel,
//           ),
//         ),
//         child,
//       ],
//     );
//   }

//   // return Container(
//   //   padding: const EdgeInsets.all(16),
//   //   child: Column(
//   //     mainAxisSize: MainAxisSize.min,
//   //     children: [
//   //       Text(
//   //         exportState.toString(),
//   //         style: const TextStyle(fontSize: 18),
//   //       ),
//   //       exportState.when(
//   //           data: (_) => const Text('Export successful'),
//   //           error: (err, st) => const Text('Export failed'),
//   //           loading: () => const CircularProgressIndicator.adaptive())
//   //     ],
//   //   ),
//   // );
// }
