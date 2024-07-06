import 'package:app_extensions/app_extensions.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';

import '../../router/routes/routes.dart';
import '../add_case.dart';

/// Select template bar
class SelectTemplateBar extends ConsumerWidget
    with AddCaseEventMixin, AddCaseStateMixin {
  const SelectTemplateBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currCaseTemplate = watchCurrentSelectedTemplate(ref);

    final Widget child = InkWell(
      onTap: () {
        /// on Open select template
        context.openDraggableBottomSheet<TemplateModel?>(
          builder: (_) => _SelectTemplateBottomSheet(currCaseTemplate),
          offset: 0.8,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const SizedBox(width: 16),
          Text(
            S.of(context).template.titleCase,
            style: context.textTheme.bodyMedium,
          ),
          Expanded(
            child: Text(
              (currCaseTemplate?.title ?? S.of(context).select).sentenceCase,
              textAlign: TextAlign.end,
              overflow: TextOverflow.fade,
              style: context.textTheme.titleMedium,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.unfold_more),
          const SizedBox(width: 8),
        ],
      ),
    );

    return ColoredBox(
      color: context.colorScheme.inversePrimary,
      child: SizedBox(
        height: kMinInteractiveDimension,
        child: child,
      ),
    );
  }
}

/// Select template bottom sheet widget
typedef OnTemplateSelect = void Function(TemplateModel);

class _SelectTemplateBottomSheet extends ConsumerWidget
    with AddCaseEventMixin, AddCaseStateMixin {
  const _SelectTemplateBottomSheet(this.currTemplate);

  final TemplateModel? currTemplate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final templatesListState = watchTemplateModelsList(ref);

    return templatesListState.when(
      loading: () => const Loading(),
      error: (e, st) => Loading(text: S.of(context).errorLoadingData),
      data: (result) => result.when(
        failure: (failure) => Loading(text: failure.toString()),
        success: (templates) => _TemplatesBottomSheet(
          selectedTemplateID: currTemplate?.templateID,
          templates: templates.where((e) => e.removed == 0).toList(),
          onSelect: (templateModel) {
            if (currTemplate == null ||
                currTemplate?.templateID != templateModel.templateID) {
              /// call addCaseNotifier to set the current forms data into an
              /// object before the new template models fields are rendered
              onTemplateChange(ref, templateModel);
              return;
            }
          },
        ),
      ),
    );
  }
}

///
/// Bottom sheet widget for showing template select bottomsheet dialog
///
class _TemplatesBottomSheet extends StatelessWidget {
  const _TemplatesBottomSheet({
    required this.templates,
    required this.onSelect,
    this.selectedTemplateID,
  });

  final OnTemplateSelect onSelect;
  final String? selectedTemplateID;
  final List<TemplateModel> templates;

  @override
  Widget build(BuildContext context) {
    if (templates.isEmpty) {
      return DraggableBottomSheetBuilder(
        child: ColoredBox(
          color: context.colorScheme.surface,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).noSurgeryTemplatesAvailable,
                style: context.textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: const Text('Create Template'),
                onPressed: () {
                  // Navigator.of(context).pop();

                  ///  go to add template screen
                  AddTemplateRoute(AddTemplateRoute.newItemParam)
                      .push<void>(context);
                },
              ),
            ],
          ),
        ),
      );
    }

    return DraggableBottomSheetBuilder(
      title: ListTile(
        dense: true,
        title: Text(S.of(context).selectSurgeryTemplate),
        trailing: TextButton(
          child: Text(S.of(context).close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      itemCount: templates.length,
      itemBuilder: (ctx, index) {
        final templateModel = templates[index];
        final active = selectedTemplateID == templateModel.templateID;

        return MaterialCard.outlined(
          padding: kTabLabelPadding,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          borderColor: active
              ? context.colorScheme.outline
              : context.colorScheme.surface,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              templateModel.title?.titleCase ?? S.of(context).noTitle,
            ),
            subtitle: Text(templateModel.desc ?? 'No description'),
          ),
          onTap: () {
            onSelect.call(templateModel);
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
