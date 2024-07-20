part of './activable_fields_page.dart';

class ActivableFieldsView extends ConsumerWidget {
  const ActivableFieldsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFieldsList =
        ref.watch(supportDataNotifierProvider.select((data) {
      final list = data.activeBasicFields
          .map((name) => ActivableCaseField.values.byName(name))
          .toList();

      if (list.isEmpty) return ActivableCaseField.values;
      return list;
    }));

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
                    ActivableCaseField.gender,
                    activeFieldsList,
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
                    ActivableCaseField.yob,
                    activeFieldsList,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ActivableBasicField(
                    ActivableCaseField.bmi,
                    activeFieldsList,
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
                    ActivableCaseField.side,
                    activeFieldsList,
                  ),
                ),
                HorizontalSpacer.normal,
                Expanded(
                  child: ActivableBasicField(
                    ActivableCaseField.location,
                    activeFieldsList,
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
                    ActivableCaseField.ebl,
                    activeFieldsList,
                  ),
                ),
                HorizontalSpacer.normal,
                Expanded(
                  child: ActivableBasicField(
                    ActivableCaseField.asa,
                    activeFieldsList,
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
                    ActivableCaseField.anesthesia,
                    activeFieldsList,
                  ),
                ),
              ],
            ),
            VerticalSpacer.normal,
            ActivableBasicField(
              ActivableCaseField.assistants,
              activeFieldsList,
            ),
            VerticalSpacer.normal,
            const NonActivableBsicDataField('comments'),
            VerticalSpacer.normal,
            ActivableBasicField(ActivableCaseField.pcp, activeFieldsList),
            VerticalSpacer.normal,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ActivableBasicField(
                    ActivableCaseField.icd,
                    activeFieldsList,
                  ),
                ),
                HorizontalSpacer.normal,
                Expanded(
                  child: ActivableBasicField(
                    ActivableCaseField.cpt,
                    activeFieldsList,
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
