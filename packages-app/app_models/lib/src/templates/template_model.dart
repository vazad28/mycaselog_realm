import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

import '../model_utils.dart';
import 'template_field_model.dart';

part 'template_model.realm.dart';
part 'template_model.g.dart';

enum TemplateModelProps {
  templateID,
  title,
  desc,
  type,
  speciality,
  fields,
  shared,
  createdAt,
  timestamp,
  removed;
}

@RealmModel()
@JsonSerializable(explicitToJson: true)
class _TemplateModel {
  @PrimaryKey()
  late String templateID;
  late String speciality = 'no_speciality';
  late String? title;
  late String? desc;
  late String? type = 'surgery';
  late List<$TemplateFieldModel> fields = [];
  late bool shared = false;
  late int? createdAt = 0;
  late int? timestamp = 0;
  late int? removed = 0;

  TemplateModel toRealmObject() {
    return TemplateModel(templateID,
        speciality: speciality,
        title: title,
        desc: desc,
        type: type,
        fields: fields
            .map((e) => TemplateFieldModelX.fromJson(e.toJson()))
            .toList(),
        shared: shared,
        createdAt: createdAt,
        timestamp: timestamp,
        removed: removed,);
  }

  static TemplateModel fromJson(Map<String, dynamic> json) =>
      _$TemplateModelFromJson(json).toRealmObject();

  Map<String, dynamic> toJson() => _$TemplateModelToJson(this);
}

extension TemplateModelX on TemplateModel {
  static TemplateModel zero() {
    final timestamp = ModelUtils.getTimestamp;
    final templateModel = TemplateModel(
      ModelUtils.uniqueID,
      createdAt: timestamp,
      timestamp: timestamp,
    );

    return templateModel;
  }

  static TemplateModel fromJson(Map<String, dynamic> json) =>
      _$TemplateModelFromJson(json).toRealmObject();

  Map<String, dynamic> toJson() => _$TemplateModelToJson(this);
}
