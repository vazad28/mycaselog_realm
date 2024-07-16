import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recase/recase.dart';

import '../../../router/routes/routes.dart';
import '../shared_templates.dart';

class SharedTemplatesView extends ConsumerWidget {
  const SharedTemplatesView({required this.speciality, super.key});
  final String speciality;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sharedTemplates =
        ref.watch(sharedTemplatesNotifierProvider(speciality));

    if (sharedTemplates.isEmpty) {
      return const Center(child: Text('No templates'));
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
      itemBuilder: (context, index) {
        final e = sharedTemplates[index];
        return MaterialCard.outlined(
          padding: const EdgeInsets.all(4),
          onTap: () {
            AddTemplateRoute(AddTemplateRoute.newItemParam)
                .push<String?>(context)
                .then((newTemplateID) {
              /// if the callback was with ID, the imported  template was saved
              /// So we go to the templates home screen
              if (context.mounted && newTemplateID != null) {
                context.pop();
              }
            });

            Future<void>.delayed(Durations.medium1).then(
              (_) => ref
                  .watch(
                    sharedTemplatesNotifierProvider(speciality).notifier,
                  )
                  .importSharedTemplate(sharedTemplates[index]),
            );
          },
          child: ListTile(
            title: Text(e.title?.titleCase ?? 'No title'),
            subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(e.desc ?? 'No description'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        e.displayName ?? 'Annonymous user',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    Text(
                      '${e.useCount} times',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: AppSpacing.md,
      ),
      itemCount: sharedTemplates.length,
    );
  }
}
