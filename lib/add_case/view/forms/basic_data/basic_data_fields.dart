part of '../forms.dart';

/// ----- Surgery Date -----
class SurgeryDateField extends StatelessWidget {
  const SurgeryDateField({super.key});

  @override
  Widget build(BuildContext context) {
    return ReactiveTimestampPicker(
      formControlName: BasicDataModelProps.surgeryDate.name,
      type: ReactiveTimestampPickerFieldType.dateTime,
      dateFormat: DateFormat('MMM dd, yyyy'),
      decoration: context.inputDecorOutline(
        labelText: BasicDataModelProps.surgeryDate.name,
        suffixIcon: const Icon(ThemeConstants.suffixIcon),
      ),
    );
  }
}

/// ----- Diagnosis Field -----
class DiagnosisField extends ConsumerWidget {
  const DiagnosisField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final autoCompleteData = ref.watch(autoCompleteProvider);

    final name = BasicDataModelProps.diagnosis.name;
    return ReactiveTextField<String>(
      formControlName: name,
      decoration: context.inputDecorOutline(
        labelText: name.titleCase,
        suffixIcon: const Icon(ThemeConstants.suffixIcon),
      ),
      readOnly: true,
      minLines: 1,
      maxLines: 4,
      onTap: (control) {
        showSearch<String?>(
          context: context,
          query: control.value,
          delegate: AddCaseAutoCompleteDelegate(
            autocompleteListType: AutoCompleteDataType.string,
            onQueryStringList: (query) {
              return ref
                  .read(autoCompleteNotifierProvider.notifier)
                  .diagnosisAutoComplete(query);
            },
          ),
        ).then((newValue) {
          if (newValue?.isEmpty ?? true) return null;
          control.value = newValue;
        });
      },
    );
  }
}

/// ----- Surgery Field -----
class SurgeryField extends ConsumerWidget {
  const SurgeryField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = BasicDataModelProps.surgery.name;

    return ReactiveTextField<String>(
      formControlName: name,
      decoration: context.inputDecorOutline(
        labelText: name.titleCase,
        suffixIcon: const Icon(ThemeConstants.suffixIcon),
      ),
      readOnly: true,
      minLines: 1,
      maxLines: 4,
      onTap: (control) {
        showSearch<String?>(
          context: context,
          query: control.value,
          delegate: AddCaseAutoCompleteDelegate(
            autocompleteListType: AutoCompleteDataType.string,
            onQueryStringList: (query) {
              return ref
                  .read(autoCompleteNotifierProvider.notifier)
                  .surgeryAutoComplete(query);
            },
          ),
        ).then((newValue) {
          if (newValue?.isEmpty ?? true) return null;
          control.value = newValue;
        });
      },
    );
  }
}

/// ----- ASA Field -----
class AsaField extends StatelessWidget {
  const AsaField({super.key});

  @override
  Widget build(BuildContext context) {
    final name = BasicDataModelProps.asa.name;
    return ReactiveDropdownField<int>(
      formControlName: name,
      decoration: context.inputDecorOutline(labelText: name.titleCase),
      items: [1, 2, 3, 4]
          .map(
            (grade) =>
                DropdownMenuItem(value: grade, child: Text(grade.toString())),
          )
          .toList(),
    );
  }
}

/// ----- Surgery Side -----
class SurgerySideField extends StatelessWidget {
  const SurgerySideField({super.key});

  @override
  Widget build(BuildContext context) {
    final name = BasicDataModelProps.side.name;
    return ReactiveDropdownField<String>(
      formControlName: name,
      decoration: context.inputDecorOutline(labelText: name.titleCase),
      items: S.current.surgerySideList
          .split(',')
          .map(
            (e) => DropdownMenuItem<String>(value: e, child: Text(e.titleCase)),
          )
          .toList(),
    );
  }
}

/// ----- Ebl Field -----
class EblField extends StatelessWidget {
  const EblField({super.key});

  @override
  Widget build(BuildContext context) {
    final name = BasicDataModelProps.ebl.name;

    return ReactiveTextField<int>(
      formControlName: name,
      keyboardType: TextInputType.number,
      decoration: context.inputDecorOutline(labelText: name.titleCase),
    );
  }
}

/// ----- Location Field -----
class SurgeryLocationField extends ConsumerWidget with AppMixins {
  const SurgeryLocationField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = BasicDataModelProps.location.name;

    final options = supportDataSelect<SurgeryLocationModel>(
        ref, (supportData) => supportData.surgeryLocations);

    final items = options
        .map(
          (e) => RadioSelectOption<String>(
            title: e.name?.titleCase ?? S.of(context).noTitle,
            value: e.name ?? S.of(context).noTitle,
          ),
        )
        .toList();

    return ReactiveSingleSelectField(
      formControlName: name,
      decoration: context.inputDecorOutline(labelText: name),
      items: items,
      title: S.of(context).locations,
      //subTitle: Text(S.of(context).locations),
      allowAdd: true,
    );
  }
}

/// ----- Anesthesia Field -----
class AnesthesiaField extends ConsumerWidget {
  const AnesthesiaField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = BasicDataModelProps.anesthesia.name;

    final options = S.of(context).anesthesiaTypes.split(',');

    /// all options for radio screen
    final items = options
        .map((e) => RadioSelectOption<String>(title: e.titleCase, value: e))
        .toList();

    return ReactiveSingleSelectField(
      title: name,
      formControlName: name,
      decoration: context.inputDecorOutline(labelText: name),
      items: items,
    );
  }
}

/// ----- Anesthesia Block Field -----
class AnesthesiaBlockField extends ConsumerWidget with AppMixins {
  const AnesthesiaBlockField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = BasicDataModelProps.anesthesiaBlock.name;

    //final options = watchAnesthesiaBlocks(ref);
    final options = supportDataSelect<String>(
        ref, (supportData) => supportData.anesthesiaBlocks);

    final items = options
        .map((e) => RadioSelectOption<String>(title: e.titleCase, value: e))
        .toList();

    return ReactiveSingleSelectField(
      title: name,
      formControlName: name,
      decoration: context.inputDecorOutline(labelText: name),
      items: items,
    );
  }
}

/// ----- Assistants Field -----
class AssistantsField extends ConsumerWidget with AppMixins {
  const AssistantsField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = BasicDataModelProps.assistant.name;
    //final options = watchAssistantModels(ref);
    final options = supportDataSelect<AssistantModel>(
        ref, (supportData) => supportData.assistants);

    final items = options
        .map(
          (e) => RadioSelectOption<String>(
            title: e.name?.titleCase ?? S.of(context).noTitle,
            value: e.name?.titleCase ?? S.of(context).noTitle,
          ),
        )
        .toList();

    return ReactiveMultiSelectField(
      title: name,
      formControlName: name,
      decoration: context.inputDecorOutline(labelText: name),
      items: items,
      allowAdd: true,
    );
  }
}

/// ----- Comments Field -----
class CommentsField extends StatelessWidget {
  const CommentsField({super.key});

  @override
  Widget build(BuildContext context) {
    final name = BasicDataModelProps.comments.name;
    return ReactiveTextField<String>(
      formControlName: name,
      decoration: context.inputDecorOutline(
        labelText: name,
        suffixIcon: const Icon(ThemeConstants.suffixIcon),
      ),
      readOnly: true,
      maxLines: 4,
      minLines: 1,
      onTap: (control) {
        context
            .openModalScreen<String?>(
          CaseComments(comments: control.value),
        )
            .then((value) {
          control
            ..value = value
            ..unfocus()
            ..updateValueAndValidity()
            ..markAsTouched();
        });
      },
    );
  }
}
