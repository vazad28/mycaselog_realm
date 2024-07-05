import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../support_data/support_data.dart';
import '../../../provider/add_case_provider.dart';
import 'basic_data_fields.dart';

class BasicDataForm extends ConsumerWidget with AddCaseStateMixin {
  const BasicDataForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFieldsList = watchActiveFields(ref);

    final form = ref.watch(basicDataFormGroupProvider);

    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Flexible(flex: 3, child: SurgeryDateField()),
              if (activeFieldsList.contains(ActivableAddCaseField.asa))
                HorizontalSpacer.normal,
              if (activeFieldsList.contains(ActivableAddCaseField.asa))
                const Flexible(child: AsaField()),
            ],
          ),
          VerticalSpacer.normal,
          const DiagnosisField(),
          VerticalSpacer.normal,
          const SurgeryField(),
          VerticalSpacer.normal,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (activeFieldsList.contains(ActivableAddCaseField.side))
                const Expanded(child: SurgerySideField()),
              if (activeFieldsList.contains(ActivableAddCaseField.side) &&
                  activeFieldsList.contains(ActivableAddCaseField.ebl))
                HorizontalSpacer.normal,
              if (activeFieldsList.contains(ActivableAddCaseField.ebl))
                const Expanded(child: EblField()),
            ],
          ),
          VerticalSpacer.normal,
          if (activeFieldsList.contains(ActivableAddCaseField.location))
            const SurgeryLocationField(),

          VerticalSpacer.normal,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(child: AnesthesiaField()),
              if (activeFieldsList
                  .contains(ActivableAddCaseField.anesthesiaBlock)) ...[
                HorizontalSpacer.normal,
                const Expanded(child: AnesthesiaBlockField()),
              ],
            ],
          ),
          VerticalSpacer.normal,
          if (activeFieldsList.contains(ActivableAddCaseField.assistants)) ...[
            const AssistantsField(),
          ],

          VerticalSpacer.normal,
          const CommentsField(),

          // /// PCP field
          // if (activeFieldsList.contains(ActivableAddCaseField.pcp)) ...[
          //   Wrapper(_pcpField),
          // ],

          // /// ICD-10 and CPT fields
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     if (activeFieldsList.contains(ActivableAddCaseField.icd))
          //       Expanded(child: Wrapper(_icdField(context, autoCompleter))),
          //     if (activeFieldsList.contains(ActivableAddCaseField.cpt))
          //       Expanded(child: Wrapper(_cptField(context, autoCompleter))),
          //   ],
          // ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
