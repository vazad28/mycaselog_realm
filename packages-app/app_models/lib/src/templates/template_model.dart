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
  late String? templateID;
  late String? speciality;
  late String? title;
  late String? desc;
  late String? type = 'surgery';
  late List<$TemplateFieldModel> fields = [];
  late bool? shared = false;
  late int? createdAt = 0;
  late int? timestamp = 0;
  late int? removed = 0;

  // @override
  // Map<String, dynamic> toJson() => _$TemplateModelToJson(this);
}

extension TemplateModelX on TemplateModel {
  static TemplateModel _toRealmObject(_TemplateModel templateModel) {
    return TemplateModel(
      templateModel.templateID,
      createdAt: templateModel.timestamp,
      timestamp: templateModel.timestamp,
    );
  }

  static TemplateModel zero(int timestamp) {
    final templateModel = TemplateModel(
      ModelUtils.uniqueID,
      createdAt: timestamp,
      timestamp: timestamp,
    );

    return templateModel;
  }

  static TemplateModel fromJson(Map<String, dynamic> json) =>
      _toRealmObject(_$TemplateModelFromJson(json));

  Map<String, dynamic> toJson() => _$TemplateModelToJson(this);
}
