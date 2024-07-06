import 'package:app_models/app_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../add_template.dart';

part '../../../generated/templates/add_template/provider/add_template_fields_provider.freezed.dart';
part '../../../generated/templates/add_template/provider/add_template_fields_provider.g.dart';

/// ////////////////////////////////////////////////////////////////////
/// MIXINS
/// ////////////////////////////////////////////////////////////////////
@Freezed(
  copyWith: false,
  equal: false,
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions(maybeMap: false, mapOrNull: false),
)
class AddTemplateFieldsEvent with _$AddTemplateFieldsEvent {
  const factory AddTemplateFieldsEvent.onAddUpdateField(
    TemplateFieldModel? data,
  ) = _OnAddUpdateField;

  const factory AddTemplateFieldsEvent.onImportFields(
    TemplateModel templateModel,
  ) = _OnImportFields;

  const factory AddTemplateFieldsEvent.reOrderFields({
    required List<TemplateFieldModel> list,
  }) = _ReOrderFields;
}

mixin AddTemplateFieldsEventMixin {
  void addUpdateField(WidgetRef ref, TemplateFieldModel? data) => ref
      .watch(addTemplateFieldsNotifierProvider.notifier)
      .on(AddTemplateFieldsEvent.onAddUpdateField(data));

  void reOrderFields(WidgetRef ref, List<TemplateFieldModel> list) => ref
      .watch(addTemplateFieldsNotifierProvider.notifier)
      .on(AddTemplateFieldsEvent.reOrderFields(list: list));

  void importFields(WidgetRef ref, TemplateModel templateModel) => ref
      .watch(addTemplateFieldsNotifierProvider.notifier)
      .on(AddTemplateFieldsEvent.onImportFields(templateModel));
}

mixin AddTemplateFieldsStateMixin {
  List<TemplateFieldModel>? templateFieldsListState(WidgetRef ref) =>
      ref.watch(addTemplateFieldsNotifierProvider);
}

/// ////////////////////////////////////////////////////////////////////
/// Main provider
/// ////////////////////////////////////////////////////////////////////
@riverpod
class AddTemplateFieldsNotifier extends _$AddTemplateFieldsNotifier
    with LoggerMixin {
  @override
  List<TemplateFieldModel>? build() {
    final templateModel = ref.watch(addTemplateSeederProvider);

    return templateModel?.fields;
    // if (templateModel?.fields?.isEmpty ?? true) {
    //   return null;
    // }
    // return templateModel?.fields ?? [];
  }

  Future<void> on(AddTemplateFieldsEvent event) async {
    event.map(
      onImportFields: (value) => _onImportFields(value.templateModel),
      reOrderFields: (value) => _reOrderFields(value.list),
      onAddUpdateField: (value) => _onAddUpdateField(value.data),
    );
  }

  void _reOrderFields(List<TemplateFieldModel> list) {
    final fields = List<TemplateFieldModel>.from(list);
    for (var i = 0; i < fields.length; i++) {
      fields[i] = fields[i]..idx = i;
    }
    state = fields;
  }

  void _onImportFields(TemplateModel templateModel) {
    if (templateModel.fields.isEmpty) return;
    _reOrderFields(templateModel.fields);
  }

  void _onAddUpdateField(TemplateFieldModel? newField) {
    if (newField == null) return;

    final fields = List<TemplateFieldModel>.from(state ?? []);
    final index =
        fields.indexWhere((element) => element.fieldID == newField.fieldID);

    if (index >= 0) {
      fields[index] = newField;
      state = fields;
    } else {
      fields.add(newField);
      state = fields;
    }
  }
}
