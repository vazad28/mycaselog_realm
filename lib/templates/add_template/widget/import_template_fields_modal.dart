import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';

import '../../index.dart';

class ImportTemplateFieldsModal extends ConsumerWidget {
  const ImportTemplateFieldsModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.templates),
        elevation: 1,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kMinInteractiveDimension * .75),
          child: SizedBox(
            height: kMinInteractiveDimension,
            width: double.infinity,
            child: Center(
              child: Text(
                context.l10n.selectTemplateForFieldImport,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
      body: const _ImportTemplateFieldsModal(),
    );
  }
}

class _ImportTemplateFieldsModal extends ConsumerWidget
    with AddTemplateStateMixin, AddTemplateEventMixin {
  const _ImportTemplateFieldsModal();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final templateModels = ref.watch(templatesListProvider);

    if (templateModels.isEmpty) {
      return Loading(text: context.l10n.noUserTemplates);
    }

    return ListView.separated(
      itemCount: templateModels.length,
      padding: const EdgeInsets.all(4),
      separatorBuilder: (_, index) => const Divider(height: 1, indent: 16),
      itemBuilder: (_, index) {
        final templateModel = templateModels[index];

        return MaterialCard.outlined(
          onTap: () {
            Navigator.pop(context, templateModels[index]);
          },
          child: MaterialCardTile(
            title: templateModel.title?.titleCase ?? context.l10n.noTitle,
            subTitle: templateModel.desc ?? context.l10n.noDescription,
          ),
        ).paddingAll(8);
      },
    );
  }
}
