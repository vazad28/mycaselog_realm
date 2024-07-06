import 'package:app_l10n/app_l10n.dart';
import 'package:flutter/material.dart';

class TemplatesBottomSheetWidget extends StatelessWidget {
  const TemplatesBottomSheetWidget({
    required this.addNewTemplate,
    required this.addSharedTemplate,
    super.key,
  });

  final VoidCallback addNewTemplate;
  final VoidCallback addSharedTemplate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.create),
            title: Text(
              S.of(context).createTemplate,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              S.of(context).createTemplateSubTitle,
            ),
            onTap: () {
              Navigator.pop(context);

              addNewTemplate.call();
            },
          ),
          const Divider(indent: 64),
          ListTile(
            leading: const Icon(Icons.folder_shared),
            title: Text(
              S.of(context).importSharedTemplate,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(
              S.of(context).importSharedTemplateSubTitle,
            ),
            onTap: () {
              Navigator.pop(context);
              addSharedTemplate.call();
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
