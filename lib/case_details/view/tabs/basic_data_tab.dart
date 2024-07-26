import 'package:app_annotations/app_annotations.dart';
import 'package:app_extensions/app_extensions.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/app_mixins.dart';
import '../../case_details.dart';

class CaseDetailsBasicTab extends ConsumerWidget {
  const CaseDetailsBasicTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caseDetails = ref.watch(caseDetailsNotifierProvider);

    return caseDetails.maybeWhen(
      orElse: () => const Loading(),
      data: (caseModel) {
        return Builder(
          builder: (context) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverOverlapInjector(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                    context,
                  ),
                ),
                SliverList(
                  key: Key(
                    '__case_details_basic_tab_${caseModel.timestamp}__',
                  ),
                  delegate: SliverChildListDelegate([
                    const SizedBox(height: 8),
                    LabeledDivider(
                      label: 'Patient data',
                      backgroundColor:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                    ),
                    _PatientDetailsWidget(
                      caseModel: caseModel,
                    ),
                    LabeledDivider(
                      label: 'Basic case data',
                      backgroundColor:
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                    ),
                    _BasicCaseDataWidget(
                      caseModel: caseModel,
                    ),
                  ]),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class _PatientDetailsWidget extends ConsumerWidget
    with CaseDetailsMixin, AppMixins {
  const _PatientDetailsWidget({
    required this.caseModel,
  });

  final CaseModel caseModel;

  // ignore: non_constant_identifier_names
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (caseModel.patientModel == null) return const Text('No patient data');

    final activeFieldsList = watchActiveFieldsList(ref);

    final children = [
      Expanded(
        child: CaseDetailsField(
          label: S.of(context).name,
          value: caseModel.patientModel!.initials,
        ),
      ),
      if (activeFieldsList.contains(ActivableCaseField.gender)) ...[
        Expanded(
          child: CaseDetailsField(
            label: S.of(context).gender,
            value: caseModel.patientModel!.gender,
          ),
        ),
      ],
      if (activeFieldsList.contains(ActivableCaseField.yob)) ...[
        Expanded(
          child: CaseDetailsField(
            label: S.of(context).birthYear,
            value: caseModel.patientModel!.yob,
          ),
        ),
      ],
      if (activeFieldsList.contains(ActivableCaseField.bmi)) ...[
        Expanded(
          child: CaseDetailsField(
            label: S.of(context).bmi,
            value: caseModel.patientModel!.bmi?.toString() ?? '-',
          ),
        ),
      ],
    ];

    final Widget child = Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 500 || children.length < 4) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            );
          } else {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [children[0], children[1]],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [children[2], children[3]],
                ),
              ],
            );
          }
        },
      ),
    );

    /// return builder
    return child;
    //});
  }
}

class _BasicCaseDataWidget extends ConsumerWidget
    with CaseDetailsMixin, AppMixins {
  const _BasicCaseDataWidget({required this.caseModel});

  final CaseModel caseModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFieldsList = watchActiveFieldsList(ref);

    return Container(
      padding: const EdgeInsets.all(6),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                child: CaseDetailsField(
                  label: S.of(context).surgeryDate,
                  value: caseModel.surgeryDate.formatMDY(),
                  suffix: caseModel.surgeryDate.formatHM(),
                ),
              ),
              if (activeFieldsList.contains(ActivableCaseField.asa))
                Flexible(
                  child: CaseDetailsField(
                    label: S.of(context).asa,
                    value: caseModel.asa.toString(),
                  ),
                ),
            ],
          ),

          CaseDetailsField(
            label: S.of(context).diagnosis,
            value: caseModel.diagnosis,
          ),

          CaseDetailsField(
            label: S.of(context).surgery,
            value: caseModel.surgery,
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (activeFieldsList.contains(ActivableCaseField.asa))
                Expanded(
                  child: CaseDetailsField(
                    label: S.of(context).surgerySide,
                    value: caseModel.side.toString(),
                  ),
                ),
              if (activeFieldsList.contains(ActivableCaseField.bmi))
                Expanded(
                  child: CaseDetailsField(
                    label: S.of(context).ebl,
                    value: caseModel.ebl.toString(),
                  ),
                ),
            ],
          ),

          if (activeFieldsList.contains(ActivableCaseField.location))
            CaseDetailsField(
              label: S.of(context).location,
              value: caseModel.location,
            ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CaseDetailsField(
                  label: S.of(context).anesthesia,
                  value: caseModel.anesthesia,
                ),
              ),
              if (activeFieldsList
                  .contains(ActivableCaseField.anesthesiaBlock)) ...[
                Expanded(
                  child: CaseDetailsField(
                    label: S.of(context).anesthesiaBlock,
                    value: caseModel.anesthesiaBlock ?? '-',
                  ),
                ),
              ],
            ],
          ),
          if (activeFieldsList.contains(ActivableCaseField.assistants)) ...[
            CaseDetailsField(
              label: S.of(context).assistants,
              value: caseModel.assistant.join(','),
            ),
          ],

          CaseDetailsField(
            label: S.of(context).comments,
            value: caseModel.comments ?? '-',
          ),

          // /// PCP field
          // if (activeFieldsList.contains(ActivableCaseField.pcp))
          //   CaseDetailsField(
          //     label: S.of(context).pcp,
          //     value: caseModel.pcpModel?.name ?? '-',
          //   ),

          /// ICD-10 and CPT fields
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (activeFieldsList.contains(ActivableCaseField.icd))
                Expanded(
                  child: CaseDetailsField(
                    label: S.of(context).icd10,
                    value: caseModel.icd ?? '-',
                  ),
                ),
              if (activeFieldsList.contains(ActivableCaseField.cpt))
                Expanded(
                  child: CaseDetailsField(
                    label: S.of(context).cpt,
                    value: caseModel.cpt ?? '-',
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
    //});
  }
}
