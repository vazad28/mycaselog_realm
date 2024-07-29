// ignore_for_file: require_trailing_commas

import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger_client/logger_client.dart';

import '../../case_details.dart';

class CaseDetailsTemplatedTab extends ConsumerWidget
    with CaseDetailsMixin, LoggerMixin {
  const CaseDetailsTemplatedTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caseTemplateAsync = watchCaseDetailsTemplateModel(ref);

    return caseTemplateAsync.when(
      loading: () => Center(child: Text(S.of(context).select)),
      error: (err, _) => Center(child: Text(err.toString())),
      data: (templateModel) {
        return _TemplateCaseData(templateModel: templateModel);
      },
    );
  }
}

class _SelectedTemplateBar extends ConsumerWidget with CaseDetailsMixin {
  const _SelectedTemplateBar({required this.templateModel});

  final TemplateModel? templateModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caseTemplateAsync = watchCaseDetailsTemplateModel(ref);

    return SelectTemplateBarWidget(
      title: caseTemplateAsync.when(
        data: (templateModel) {
          return templateModel?.title ?? S.of(context).select;
        },
        loading: () => S.of(context).select,
        error: (err, _) => S.of(context).errorTitle,
      ),
    );
  }
}

class _TemplateCaseData extends ConsumerWidget with CaseDetailsMixin {
  const _TemplateCaseData({required this.templateModel});

  final TemplateModel? templateModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caseModelAsync = watchCaseDetailsModel(ref);

    return caseModelAsync.maybeWhen(
        orElse: () => const Loading(),
        data: (caseModel) {
          final child = CustomScrollView(
            slivers: <Widget>[
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  context,
                ),
              ),
              SliverToBoxAdapter(
                  child: _SelectedTemplateBar(
                templateModel: templateModel,
              )),
              if (caseModel.fieldsData.isEmpty)
                LoadingSliver(text: S.of(context).noTemplateData)
              else
                SliverList(
                  key: ValueKey(caseModelAsync.value?.fieldsData),
                  delegate: SliverChildListDelegate([
                    _TemplateCaseDataWidget(
                      caseModel: caseModel,
                      templateModel: templateModel,
                    )
                  ]),
                )
            ],
          );

          return Builder(builder: (context) => child);
        });
  }
}

class _TemplateCaseDataWidget extends StatelessWidget {
  const _TemplateCaseDataWidget({
    required this.caseModel,
    required this.templateModel,
  });

  final CaseModel caseModel;
  final TemplateModel? templateModel;

// ignore: non_constant_identifier_names
  Widget Wrapper(Widget child) =>
      Padding(padding: const EdgeInsets.all(6), child: child);

  @override
  Widget build(BuildContext context) {
    final fieldsList = List<TemplateFieldModel>.from(
      caseModel.fieldsData,
    );

    /// remove the field models that are not in the current template fields
    if (templateModel != null) {
      final templateSlugs = templateModel!.fields.map((e) => e.slug).toList();
      fieldsList.removeWhere((e) => !templateSlugs.contains(e.slug));
    }

    /// order fields by its index values in template
    fieldsList.sort((a, b) => a.idx.compareTo(b.idx));

    /// to hold our fields widgets
    final fieldWidgets = <Widget>[const SizedBox(height: 12)];

    for (final TemplateFieldModel? templateField in fieldsList) {
      if (templateField == null) continue;

      fieldWidgets.add(
        CaseDetailsField(
          label: templateField.title,
          value: templateField.value.toString(),
          suffix: templateField.suffixText,
        ),
      );
    }

    return Column(
      children: fieldWidgets
        ..add(
          const SizedBox(height: 16),
        ),
    );
  }
}

class SectionHeaderDelegate extends SliverPersistentHeaderDelegate {
  SectionHeaderDelegate(this.title, [this.height = 50]);
  final String title;
  final double height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).primaryColor,
      alignment: Alignment.center,
      child: Text(title),
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => false;
}
