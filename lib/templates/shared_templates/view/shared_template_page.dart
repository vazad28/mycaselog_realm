import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misc_packages/misc_packages.dart';
import 'package:recase/recase.dart';
import 'package:state_of/state_of.dart';

import '../../../core/failures/app_failures.dart';
import '../../../core/services/services.dart';
import '../../../router/routes/routes.dart';
import '../../index.dart';
import '../shared_templates.dart';
import '../widget/import_template_info_dialog.dart';

class SharedTemplatePage extends ConsumerStatefulWidget {
  const SharedTemplatePage(this.sharedTemplateModel, {super.key});

  final SharedTemplateModel sharedTemplateModel;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SharedTemplatePageState();
}

class _SharedTemplatePageState extends ConsumerState<SharedTemplatePage> {
  late final SharedTemplateModel sharedTemplateModel;

  @override
  void initState() {
    sharedTemplateModel = widget.sharedTemplateModel;

    Future<void>.delayed(Durations.extralong4).then((_) {
      _showImportTemplateInfoPopUp(ref);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<StateOf<String>>(sharedTemplateNotifierProvider, (_, next) {
      if (next.isFailure) {
        context.showSnackBar(next.failure.toLocalizedString());
      }
      if (next.isSuccess) {
        if (next.data == null) return context.showSnackBar('no template id');
        AddTemplateRoute(next.data!).pushReplacement(context);
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          sharedTemplateModel.speciality.titleCase,
        ),
      ),
      body: sharedTemplateModel.fields.isEmpty
          ? Center(
              child: Text(S.of(context).noTemplateFields),
            )
          : SharedTemplateView(
              sharedTemplateModel: sharedTemplateModel,
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Material(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: context.colorScheme.primary,
            foregroundColor: context.colorScheme.onPrimary,
          ),
          onPressed: () {
            ref
                .watch(sharedTemplateNotifierProvider.notifier)
                .importSharedTemplate(sharedTemplateModel);
          },
          child: Text(
            S.of(context).importSharedTemplate,
          ),
        ),
      ),
    );
  }

  void _showImportTemplateInfoPopUp(WidgetRef ref) {
    if (ref.read(localStorageProvider).getImportTemplateInfoReviewed()) return;

    showDialog<void>(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const ImportTemplateInfoDialog();
      },
    );
  }
}
