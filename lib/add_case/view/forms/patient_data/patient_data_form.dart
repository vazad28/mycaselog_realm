part of '../forms.dart';

/// Widget
class PatientDataForm extends ConsumerWidget with AddCaseMixin, AppMixins {
  const PatientDataForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFieldsList = watchActiveFieldsList(ref);

    final form = ref.watch(patientDataFormGroupProvider);

    final children = [
      /// Name initial field
      Expanded(
        child: PatientNameField(
          cryptControl: form.controls[PatientDataModelProps.crypt.name]
              as AbstractControl<String?>?,
        ),
      ),

      /// Gender field if in acrive fields
      if (activeFieldsList.contains(ActivableCaseField.gender)) ...[
        const Expanded(child: PatientGenderField()),
      ],

      /// Year of birth field
      if (activeFieldsList.contains(ActivableCaseField.yob)) ...[
        const Expanded(child: PatientYobField()),
      ],

      /// Gender field if in acrive fields
      if (activeFieldsList.contains(ActivableCaseField.bmi)) ...[
        const Expanded(child: PatientBmiField()),
      ],
    ];

    final childrensCount = children.length;

    final Widget child = ColoredBox(
      color: context.colorScheme.surface,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 500 || children.length < 4) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: (children as List<Widget>)
                  .intersperse(
                    const SizedBox(
                      width: AppSpacing.sm,
                    ),
                  )
                  .toList(),
            );
          } else {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    children[0],
                    if (childrensCount > 1) HorizontalSpacer.normal,
                    children[1],
                  ],
                ),
                if (children.length > 2) VerticalSpacer.normal,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    children[2],
                    if (childrensCount > 3) HorizontalSpacer.normal,
                    children[3],
                  ],
                ),
              ],
            );
          }
        },
      ),
    );

    return ReactiveForm(
      key: ObjectKey(form),

      /// important else the vies does not update on OCR
      formGroup: form,
      child: child,
    );
  }
}
