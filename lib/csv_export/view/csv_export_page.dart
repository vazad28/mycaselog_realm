import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../csv_export.dart';

class CsvExportPage extends ConsumerWidget {
  const CsvExportPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(csvExportNotifierProvider.notifier);

    final child = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...ref.watch(csvExportNotifierProvider).maybeWhen(
              success: (value) => [
                Text(
                  'CSV export created successfully'.hardcoded,
                ),
                VerticalSpacer.large,
                AppButton(
                  onPressed: notifier.shareExportedCsvFile,
                  child: const Text('Share Exported CSV File'),
                ),
              ],
              failure: (err) => [
                Text(
                  'Exporting CSV file failed'.hardcoded,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.red),
                ),
              ],
              loading: (_) => [
                Loading(
                  text: 'creating CSV data..'.hardcoded,
                  showSpinner: true,
                ),
              ],
              orElse: () => [
                Text(
                  'Tap to export database as CSV file'.hardcoded,
                ),
                VerticalSpacer.large,
                AppButton(
                  buttonType: ButtonType.outlined,
                  onPressed: notifier.createCsvExportFile,
                  child: const Text('Export database as CSV'),
                ),
              ],
            ),
      ],
    );
    return SafeArea(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: Breakpoints.mobile,
          maxHeight: 240,
          minHeight: 240,
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xxlg),
          child: child,
        ),
      ),
    );
  }
}
