import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../support_data.dart';

part 'activable_fields_enum.dart';

part '../../../../generated/support_data/features/activable_fields/provider/activable_fields_provider.freezed.dart';
part '../../../../generated/support_data/features/activable_fields/provider/activable_fields_provider.g.dart';

@Freezed(
  copyWith: false,
  equal: false,
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions(maybeMap: false, mapOrNull: false),
)
class ActivableFieldsEvent with _$ActivableFieldsEvent {
  const factory ActivableFieldsEvent.updateActivableField(
    ActivableAddCaseField field,
  ) = _UpdateActiveField;

  const factory ActivableFieldsEvent.resetActivableFields() =
      _ResetActivableFields;
}

mixin ActivableFieldsEventMixin {
  void updateActivableField(WidgetRef ref, ActivableAddCaseField field) => ref
      .watch(activableFieldsNotifierProvider.notifier)
      .on(ActivableFieldsEvent.updateActivableField(field));

  void resetActivableFields(WidgetRef ref) => ref
      .watch(activableFieldsNotifierProvider.notifier)
      .on(const ActivableFieldsEvent.resetActivableFields());
}

mixin ActivableFieldsStateMixin {
  List<ActivableAddCaseField> activableFieldsList(WidgetRef ref) =>
      ref.watch(activableFieldsNotifierProvider);
}

@riverpod
class ActivableFieldsNotifier extends _$ActivableFieldsNotifier {
  @override
  List<ActivableAddCaseField> build() {
    final fieldList = ref.watch(
      supportDataNotifierProvider.select((value) => value.activeBasicFields),
    );

    if (fieldList.isEmpty) return ActivableAddCaseField.values;

    return fieldList
        .map((name) => ActivableAddCaseField.values.byName(name))
        .toList();
  }

  void on(ActivableFieldsEvent e) {
    e.map(
      updateActivableField: (v) => _updateActivableField(v.field),
      resetActivableFields: (_) => _resetActivableFields(),
    );
  }

  void _updateActivableField(ActivableAddCaseField field) {
    final activeFields = List<ActivableAddCaseField>.from(state);
    if (activeFields.contains(field)) {
      activeFields.remove(field);
    } else {
      activeFields.add(field);
    }
    _updateActivableFields(activeFields);
  }

  void _resetActivableFields() {
    _updateActivableFields(ActivableAddCaseField.values);
  }

  ///
  /// Common method
  ///
  void _updateActivableFields(List<ActivableAddCaseField> fields) {
    state = fields;
    ref.read(supportDataNotifierProvider.notifier).on(
          SupportDataEvent.updateActivableFields(fields),
        );
  }
}
