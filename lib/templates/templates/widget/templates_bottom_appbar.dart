import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/templates_provider.dart';

class TemplatesBottomAppBar extends ConsumerWidget
    with TemplatesEventMixin, TemplatesStateMixin
    implements PreferredSizeWidget {
  const TemplatesBottomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kMinInteractiveDimension);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: context.colorScheme.surfaceContainerHighest,
      height: kMinInteractiveDimension,
      width: double.infinity,
      child: Row(
        children: [
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              'Showing Templates',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          TextButton(
            onPressed: () => showHideActiveTemplate(ref),
            child: showActiveTemplatesOnly(ref)
                ? const Text('ACTIVE')
                : const Text('IN-ACTIVE'),
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}
