import 'package:app_extensions/app_extensions.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';

import '../../../core/core.dart';
import '../../../router/routes/routes.dart';
import '../templates.dart';

class TemplatesPage extends ConsumerStatefulWidget {
  const TemplatesPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TemplatesPageState();
}

class _TemplatesPageState extends ConsumerState<TemplatesPage> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    /// to prevent error - scroll controlled used after disposed
    Future<void>.delayed(Durations.long1)
        .then((_) => _scrollController.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).templates),
        bottom: const TemplatesBottomAppBar(),
      ),
      body: AsyncValueWidget(
        value: ref.watch(templatesNotifierProvider),
        data: (templateModels) {
          return ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(AppSpacing.md),
            itemCount: templateModels.length,
            itemBuilder: (_, index) => TemplatesListTile(
              templateModel: templateModels.elementAt(index),
            ).paddingOnly(bottom: AppSpacing.md),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: ScrollReactiveFabButton(
        _scrollController,
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
                if (speciality != null && context.mounted) {
                  SharedTemplatesRoute(speciality).push<void>(context);
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
