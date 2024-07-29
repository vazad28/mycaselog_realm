import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/failures/app_failures.dart';
import '../database_io.dart';

class DatabaseExportView extends ConsumerWidget {
  const DatabaseExportView({
    required this.onCancel,
    super.key,
  });

  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(databaseExportNotifierProvider.notifier);

    final child = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...ref.watch(databaseExportNotifierProvider).maybeWhen(
              success: (value) => [
                Text(
                  'Database export created successfully'.hardcoded,
                ),
                VerticalSpacer.large,
                AppButton(
                  onPressed: notifier.shareExportedDatabaseFile,
                  child: const Text('Share Exported File'),
                ),
              ],
              failure: (err) => [
                Text(
                  err.toLocalizedString().hardcoded,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
              orElse: () => [
                Loading(
                  text: 'creating export data..'.hardcoded,
                  showSpinner: true,
                ),
              ],
            ),
      ],
    );
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: BackButton(
            onPressed: onCancel,
          ),
        ),
        child,
      ],
    );
  }
}
