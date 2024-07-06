import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:label_ocr/label_ocr.dart';
import 'package:misc_packages/misc_packages.dart';

import '../../add_case.dart';

class BasicDataTabView extends ConsumerWidget {
  const BasicDataTabView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.only(left: 12, right: 12),
      children: const [
        SizedBox(height: 8),
        LabeledDivider(
          label: 'Patient data',
        ),
        _PatientDataView(),
        LabeledDivider(
          label: 'Basic case data',
        ),
        BasicDataForm(),
      ],
    );
  }
}

class _PatientDataView extends ConsumerWidget with AddCaseEventMixin {
  const _PatientDataView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caseModel = ref.watch(addCaseSeederProvider)?.caseModel;

    if (caseModel == null) return Loading(text: S.of(context).noData);

    final crypt = caseModel.patientModel?.crypt;

    const child = PatientDataForm();

    if (crypt != null) return child;

    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        FabButton(
          roundedCorner: true,
          onPressed: () {
            final patientModel = caseModel.patientModel;
            if (patientModel == null) {
              return;
              // const Loading(
              //   text: 'Patient Model is null',
              // );
            }
            context
                .openModalScreen<PatientModel?>(
              //TextRecognizerView()
              SahLabelOcr<PatientModel>(model: patientModel),
            )
                .then((patientModel) {
              if (patientModel == null) return;
              updatePatientDataFormGroup(ref, patientModel);
            });
          },
          icon: Icons.scanner,
        ),
      ],
    );
  }
}
