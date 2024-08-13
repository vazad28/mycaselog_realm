import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:label_ocr/label_ocr.dart';
import 'package:misc_packages/misc_packages.dart';

import '../../add_case.dart';

class BasicDataTabView extends StatelessWidget {
  const BasicDataTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 12, right: 12),
      children: const [
        ///<-- Patient data form
        LabeledDivider(
          label: 'Patient data',
          height: 36,
        ),
        _PatientDataForm(),
        // <-- Basic case data frorm
        LabeledDivider(
          label: 'Basic case data',
          height: 36,
        ),
        BasicDataForm(),
      ],
    );
  }
}

class _PatientDataForm extends ConsumerWidget with AddCaseMixin {
  const _PatientDataForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caseModel = ref.watch(addCaseSeederProvider).requireValue;

    final crypt = caseModel.patientModel?.crypt;

    const child = PatientDataForm();

    if (crypt != null) {
      return child; // we are not reading the label if it is edit
    }

    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        FabButton(
          roundedCorner: true,
          onPressed: () {
            final patientModel = caseModel.patientModel;
            if (patientModel == null) return;
            context
                .openModalScreen<PatientModel?>(
              SahLabelOcr<PatientModel>(model: patientModel),
            )
                .then((patientModel) {
              if (patientModel == null) return;
              updatePatientDataForm(ref, patientModel);
            });
          },
          icon: Icons.scanner,
        ),
      ],
    );
  }
}
