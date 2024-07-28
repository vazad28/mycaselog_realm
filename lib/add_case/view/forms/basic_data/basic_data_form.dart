import 'package:app_annotations/app_annotations.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../core/app_mixins.dart';
import '../../../provider/add_case_provider.dart';
import 'basic_data_fields.dart';

class BasicDataForm extends ConsumerWidget with AddCaseMixin, AppMixins {
  const BasicDataForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(basicDataFormGroupProvider);

    final activeFieldsList = watchActiveFieldsList(ref);

    return ReactiveForm(
      formGroup: form,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Flexible(flex: 3, child: SurgeryDateField()),
              if (activeFieldsList.contains(ActivableCaseField.asa))
                HorizontalSpacer.normal,
              if (activeFieldsList.contains(ActivableCaseField.asa))
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
              if (activeFieldsList.contains(ActivableCaseField.side))
                const Expanded(child: SurgerySideField()),
              if (activeFieldsList.contains(ActivableCaseField.side) &&
                  activeFieldsList.contains(ActivableCaseField.ebl))
                HorizontalSpacer.normal,
              if (activeFieldsList.contains(ActivableCaseField.ebl))
                const Expanded(child: EblField()),
            ],
          ),
          VerticalSpacer.normal,
          if (activeFieldsList.contains(ActivableCaseField.location))
            const SurgeryLocationField(),

          VerticalSpacer.normal,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(child: AnesthesiaField()),
              if (activeFieldsList
                  .contains(ActivableCaseField.anesthesiaBlock)) ...[
                HorizontalSpacer.normal,
                const Expanded(child: AnesthesiaBlockField()),
              ],
            ],
          ),
          VerticalSpacer.normal,
          if (activeFieldsList.contains(ActivableCaseField.assistants)) ...[
            const AssistantsField(),
          ],

          VerticalSpacer.normal,
          const CommentsField(),

          // /// PCP field
          // if (activeFieldsList.contains(ActivableCaseField.pcp)) ...[
          //   Wrapper(_pcpField),
          // ],

          // /// ICD-10 and CPT fields
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     if (activeFieldsList.contains(ActivableCaseField.icd))
          //       Expanded(child: Wrapper(_icdField(context, autoCompleter))),
          //     if (activeFieldsList.contains(ActivableCaseField.cpt))
          //       Expanded(child: Wrapper(_cptField(context, autoCompleter))),
          //   ],
          // ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
