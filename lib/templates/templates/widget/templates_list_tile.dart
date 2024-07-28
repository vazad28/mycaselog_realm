import 'package:app_extensions/app_extensions.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';

import '../../../router/router.dart';
import '../../index.dart';

/// ////////////////////////////////////////////////////////////////////
/// Template tile widget
///
/// We pass an instance of the model and not voidCallback as we need
/// tap and long press to call for different methods on ViewModel
/// ////////////////////////////////////////////////////////////////////
class TemplatesListTile extends ConsumerWidget {
  const TemplatesListTile({
    required this.templateModel,
    super.key,
  });

  final TemplateModel templateModel;

  /// Method to option the menu options
  void _openMoreOption(BuildContext context, WidgetRef ref) {
    /// for templates that are active
    context.openModalBottomSheet<Widget>(
      useRootNavigator: true,
      builder: (ctx) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              if (templateModel.removed == 0)
                ..._menuOptionActiveTemplates(ctx, ref),
              if (templateModel.removed != 0)
                ..._menuOptionInactiveTemplates(ctx, ref),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _menuOptionInactiveTemplates(BuildContext ctx, WidgetRef ref) {
    return [
      ListTile(
        title: const Text('Re-activate Template'),
        leading: const Icon(Icons.redo),
        subtitle: const Text(
          'Re-activate a template to make it available for use in add case',
        ),
        onTap: () {
          Navigator.of(ctx).pop();
          ref
              .watch(templatesNotifierProvider.notifier)
              .updateTemplate(templateModel, TemplateEvent.reactivate);
        },
      ),
      const Divider(indent: 64),
      ListTile(
        title: Text(S.of(ctx).delete.titleCase),
        leading: Icon(
          Icons.delete_forever,
          color: ctx.colorScheme.error,
        ),
        subtitle: const Text('Deleting a template can not be undone'),
        onTap: () {
          Navigator.of(ctx).pop();
          ref
              .watch(templatesNotifierProvider.notifier)
              .updateTemplate(templateModel, TemplateEvent.delete);
        },
      ),
    ];
  }

  List<Widget> _menuOptionActiveTemplates(
    BuildContext ctx,
    WidgetRef ref,
  ) {
    return [
      if (templateModel.shared == false)
        ListTile(
          title: const Text('Share Template'),
          leading: const Icon(Icons.file_upload_outlined),
          subtitle: const Text('Share template with other users of the app'),
          onTap: () {
            Navigator.of(ctx).pop();
            ref
                .watch(templatesNotifierProvider.notifier)
                .updateTemplate(templateModel, TemplateEvent.share);
          },
        ),
      // ignore: use_if_null_to_convert_nulls_to_bools
      if (templateModel.shared == true)
        ListTile(
          title: const Text('Un-Share Template'),
          leading: const Icon(Icons.offline_share),
          subtitle:
              const Text('Remove this template from shared templates list'),
          onTap: () {
            Navigator.of(ctx).pop();
            ref
                .watch(templatesNotifierProvider.notifier)
                .updateTemplate(templateModel, TemplateEvent.unShare);
          },
        ),
      const Divider(indent: 64),
      ListTile(
        title: const Text('De-activate Template'),
        leading: const Icon(Icons.hide_source),
        subtitle: const Text(
          '''Deactivate a template only removes it from selectable list of templates''',
        ),
        onTap: () {
          Navigator.of(ctx).pop();
          ref
              .watch(templatesNotifierProvider.notifier)
              .updateTemplate(templateModel, TemplateEvent.deactivate);
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = S.of(context);

    final backgroundColor =
        templateModel.removed != 0 ? context.colorScheme.errorContainer : null;

    final Widget column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 6),
        Text(
          templateModel.title?.titleCase ?? lang.noTitle,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.normal),
        ),
        const SizedBox(height: 4),
        Text(
          templateModel.desc?.titleCase ?? lang.noDescription,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 8),
        Text(
          '''${S.of(context).lastUpdate} : ${templateModel.timestamp?.formatMDY()}''',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 6),
      ],
    );

    final templateCard = MaterialCard.outlined(
      borderColor: context.colorScheme.outline,
      backgroundColor: backgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [column],
          ),
          Positioned(
            bottom: 6,
            right: 0,
            child: GestureDetector(
              onTap: () => _openMoreOption(context, ref),
              child: Text(
                templateModel.shared ? 'Shared' : 'Not shared',
                style: context.textTheme.labelSmall,
              ),
            ),
          ),
        ],
      ),
    );

    /// return the composed widget
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ThemeConstants.kMenuRadius),
      ),
      onTap: () {
        /// seed the provider for add template screen
        /// This way we avoid sending object through router
        AddTemplateRoute(templateModel.templateID).push<void>(context);
      },
      onLongPress: () => context.openModalBottomSheet<Widget>(
          useRootNavigator: true,
          builder: (ctx) {
            return SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 16),
                  if (templateModel.removed == 0)
                    _MenuOptionsActiveTemplate(templateModel),
                  if (templateModel.removed != 0)
                    _MenuOptionsInactiveTemplate(templateModel),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },),
      child: templateCard,
    );
  }
}

class _MenuOptionsInactiveTemplate extends ConsumerWidget {
  const _MenuOptionsInactiveTemplate(this.templateModel);

  final TemplateModel templateModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      ListTile(
        title: const Text('Re-activate Template'),
        leading: const Icon(Icons.redo),
        subtitle: const Text(
          'Re-activate a template to make it available for use in add case',
        ),
        onTap: () {
          Navigator.of(context).pop();
          ref
              .watch(templatesNotifierProvider.notifier)
              .updateTemplate(templateModel, TemplateEvent.reactivate);
        },
      ),
      const Divider(indent: 64),
      ListTile(
        title: Text(S.of(context).delete.titleCase),
        leading: Icon(
          Icons.delete_forever,
          color: context.colorScheme.error,
        ),
        subtitle: const Text('Deleting a template can not be undone'),
        onTap: () {
          Navigator.of(context).pop();
          ref
              .watch(templatesNotifierProvider.notifier)
              .updateTemplate(templateModel, TemplateEvent.delete);
        },
      ),
    ],);
  }
}

class _MenuOptionsActiveTemplate extends ConsumerWidget {
  const _MenuOptionsActiveTemplate(this.templateModel);

  final TemplateModel templateModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(children: [
      if (templateModel.shared == false)
        ListTile(
          title: const Text('Share Template'),
          leading: const Icon(Icons.file_upload_outlined),
          subtitle: const Text('Share template with other users of the app'),
          onTap: () {
            Navigator.of(context).pop();
            ref
                .watch(templatesNotifierProvider.notifier)
                .updateTemplate(templateModel, TemplateEvent.share);
          },
        ),
      // ignore: use_if_null_to_convert_nulls_to_bools
      if (templateModel.shared == true)
        ListTile(
          title: const Text('Un-Share Template'),
          leading: const Icon(Icons.offline_share),
          subtitle:
              const Text('Remove this template from shared templates list'),
          onTap: () {
            Navigator.of(context).pop();
            ref
                .watch(templatesNotifierProvider.notifier)
                .updateTemplate(templateModel, TemplateEvent.unShare);
          },
        ),
      const Divider(indent: 64),
      ListTile(
        title: const Text('De-activate Template'),
        leading: const Icon(Icons.hide_source),
        subtitle: const Text(
          '''Deactivate a template only removes it from selectable list of templates''',
        ),
        onTap: () {
          Navigator.of(context).pop();
          ref
              .watch(templatesNotifierProvider.notifier)
              .updateTemplate(templateModel, TemplateEvent.deactivate);
        },
      ),
    ],);
  }
}
