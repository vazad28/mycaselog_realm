import 'package:app_extensions/app_extensions.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';

import '../../../router/routes/routes.dart';
import '../templates.dart';

class TemplatesPage extends ConsumerWidget with TemplatesStateMixin {
  const TemplatesPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: TemplatesPage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).templates),
        bottom: const TemplatesBottomAppBar(),
      ),
      body: const TemplatesView(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ScrollReactiveFabButton(
        templatesListScrollController(ref),
        key: const Key('__add_template_fab_button_key__'),
        title: S.of(context).addTemplate.titleCase,
        onTap: () => context.openModalBottomSheet<void>(
          builder: (ctx) => TemplatesBottomSheetWidget(
            addNewTemplate: () {
              AddTemplateRoute(AddTemplateRoute.newItemParam)
                  .push<void>(context);
            },
            addSharedTemplate: () {
              _showSpecialitySelectionSheet(context).then((speciality) {
                if (speciality != null) {
                  SharedTemplatesRoute(speciality!).push<void>(context);
                }
              });
            },
          ),
        ),
      ),
    );
  }

  Future<String?> _showSpecialitySelectionSheet(BuildContext context) {
    return showModalBottomSheet<String?>(
      context: context,
      isScrollControlled: true, // set this to true
      builder: (_) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.9,
          builder: (_, controller) {
            return SafeArea(
              child: Material(
                clipBehavior: Clip.antiAlias,
                color: Theme.of(context).colorScheme.surface,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSpacing.md),
                    topRight: Radius.circular(AppSpacing.md),
                  ),
                ),
                child: TemplatesSpecialityList(controller: controller),
              ),
            );
          },
        );
      },
    );
  }
}
