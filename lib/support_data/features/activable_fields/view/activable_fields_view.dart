import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../support_data.dart';

class ActivableFieldsView extends ConsumerWidget with SupportDataStateMixin {
  const ActivableFieldsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFields = activableAddCaseFields(ref);

    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(AppSpacing.sm),
      children: [
        VerticalSpacer.normal,
        const LabeledDivider(label: 'Patient data field'),
        VerticalSpacer.normal,
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: NonActivableBsicDataField('name'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ActivableBasicField(
                    ActivableAddCaseField.gender,
                    activeFields,
                  ),
                ),
              ],
            ),
            VerticalSpacer.normal,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ActivableBasicField(
                    ActivableAddCaseField.yob,
                    activeFields,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ActivableBasicField(
                    ActivableAddCaseField.bmi,
                    activeFields,
                  ),
                ),
              ],
            ),
          ],
        ),
        VerticalSpacer.normal,
        const LabeledDivider(label: 'Basic data field'),
        VerticalSpacer.normal,
        Column(
          children: [
            const NonActivableBsicDataField('surgery date'),
            VerticalSpacer.normal,
            const NonActivableBsicDataField('diagnosis'),
            VerticalSpacer.normal,
            const NonActivableBsicDataField('surgery'),
            VerticalSpacer.normal,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ActivableBasicField(
                    ActivableAddCaseField.side,
                    activeFields,
                  ),
                ),
                HorizontalSpacer.normal,
                Expanded(
                  child: ActivableBasicField(
                    ActivableAddCaseField.location,
                    activeFields,
                  ),
                ),
              ],
            ),
            VerticalSpacer.normal,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ActivableBasicField(
                    ActivableAddCaseField.ebl,
                    activeFields,
                  ),
                ),
                HorizontalSpacer.normal,
                Expanded(
                  child: ActivableBasicField(
                    ActivableAddCaseField.asa,
                    activeFields,
                  ),
                ),
              ],
            ),
            VerticalSpacer.normal,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: NonActivableBsicDataField('anesthesia'),
                ),
                HorizontalSpacer.normal,
                Expanded(
                  child: ActivableBasicField(
                    ActivableAddCaseField.anesthesia,
                    activeFields,
                  ),
                ),
              ],
            ),
            VerticalSpacer.normal,
            ActivableBasicField(
              ActivableAddCaseField.assistants,
              activeFields,
            ),
            VerticalSpacer.normal,
            const NonActivableBsicDataField('comments'),
            VerticalSpacer.normal,
            ActivableBasicField(ActivableAddCaseField.pcp, activeFields),
            VerticalSpacer.normal,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ActivableBasicField(
                    ActivableAddCaseField.icd,
                    activeFields,
                  ),
                ),
                HorizontalSpacer.normal,
                Expanded(
                  child: ActivableBasicField(
                    ActivableAddCaseField.cpt,
                    activeFields,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ],
    );
  }
}
