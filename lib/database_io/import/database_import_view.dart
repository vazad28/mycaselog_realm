import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/core.dart';
import '../database_io.dart';

class DatabaseImportView extends ConsumerWidget {
  const DatabaseImportView({required this.onCancel, super.key});

  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final child = Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...ref.watch(databaseImportNotifierProvider).maybeWhen(
              success: (value) => [
                Text(
                  'Data imported succeesfully'.hardcoded,
                ),
                VerticalSpacer.large,
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
                  text: 'preparing data for import'.hardcoded,
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
