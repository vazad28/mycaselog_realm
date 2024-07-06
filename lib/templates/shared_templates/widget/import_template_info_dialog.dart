import 'package:app_l10n/app_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/services/services.dart';

class ImportTemplateInfoDialog extends ConsumerStatefulWidget {
  const ImportTemplateInfoDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ImportTemplateInfoDialogState();
}

class _ImportTemplateInfoDialogState
    extends ConsumerState<ImportTemplateInfoDialog> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Info'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'You can change the title and description of template here before importing the template. You will find this template in your templates list where you can add or remove fields to customize the template further.',
            ),
            CheckboxListTile(
              title: const Text('Do not show again'),
              value: isChecked,
              onChanged: (val) {
                setState(() {
                  isChecked = val ?? false;
                });
              },
            ),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            if (isChecked) {
              ref.read(localStorageProvider).setImportTemplateInfoReviewed();
            }
            Navigator.of(context).pop();
          },
          child: Text(context.l10n.ok),
        ),
      ],
    );
  }
}
