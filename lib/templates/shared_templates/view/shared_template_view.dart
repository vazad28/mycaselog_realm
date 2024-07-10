import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:misc_packages/misc_packages.dart';

import '../shared_templates.dart';

class SharedTemplateView extends StatelessWidget {
  const SharedTemplateView({required this.sharedTemplateModel, super.key});

  final SharedTemplateModel sharedTemplateModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.lg,
        horizontal: AppSpacing.xlg,
      ),
      child: GestureDetector(
        onTap: () => context.showInfoDialog(
          'Template needs to be imported to your account first for making any modification',
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              S.of(context).template.toUpperCase(),
              style: context.textTheme.titleMedium,
            ),
            const Divider(),
            VerticalSpacer.large,
            InputDecorator(
              decoration: context.inputDecorOutline(
                labelText: S.of(context).templateTitle,
              ),
              child: Text(
                sharedTemplateModel.title ?? S.of(context).noTitle,
              ),
            ),
            VerticalSpacer.large,
            InputDecorator(
              decoration: context.inputDecorOutline(
                labelText: S.of(context).templateDescription,
              ),
              child: Text(
                sharedTemplateModel.desc ?? S.of(context).noDescription,
              ),
            ),
            const SizedBox(
              height: AppSpacing.xxlg,
            ),
            Text(
              S.of(context).fields.toUpperCase(),
              style: context.textTheme.titleMedium,
            ),
            const Divider(),
            ...sharedTemplateModel.fields
                .map((e) => SharedTemplateField(templateField: e)),
          ],
        ),
      ),
    );
  }
}
