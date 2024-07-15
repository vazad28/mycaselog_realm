import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misc_packages/misc_packages.dart';

import '../../../core/app_vars.dart';
import '../../index.dart';

class AddFieldBar extends ConsumerWidget
    with AddTemplateStateMixin, AddTemplateFieldsMixin {
  const AddFieldBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final templateModel = getTemplateModel(ref);

    // if (templateModel == null) {
    //   return Loading(text: S.of(context).noTemplateData);
    // }

    final Widget button = FilledButton.icon(
      onPressed: () {
        AppVars.rootContext
            .openModalScreen<TemplateFieldModel?>(
          AddTemplateFieldPage(
            templateFieldModel: TemplateFieldModelX.zero(),
            newRecord: true,
          ),
        )
            .then((templateModel) {
          if (templateModel != null) addUpdateField(ref, templateModel);
        });
      },
      icon: const Icon(Icons.add),
      label: Text(S.of(context).addField),
      style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
    );

    final Widget tile = Row(
      children: [
        HorizontalSpacer.normal,
        Expanded(
          child: Text(S.of(context).addField.toUpperCase()),
        ),
        button,
        HorizontalSpacer.normal,
      ],
    );

    return SizedBox(
      height: kMinInteractiveDimension,
      child: ColoredBox(
        color: context.colorScheme.surfaceContainerHigh,
        child: tile,
      ),
    );
  }
}
