import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

import '../model_utils.dart';
import 'template_field_model.dart';

part 'shared_template_model.realm.dart';
part 'shared_template_model.g.dart';

enum SharedTemplateModelProps {
  templateID,
  title,
  desc,
  type,
  speciality,
  fields,
  userID,
  displayName,
  useCount,
  createdAt,
  timestamp,
  removed;
}

@RealmModel()
@JsonSerializable(explicitToJson: true)
class _SharedTemplateModel {
  @PrimaryKey()
  late String templateID;
  late String speciality = 'no_speciality';
  late String? userID;
  late String? title;
  late String? desc;
  late String? type = 'surgery';
  late List<$TemplateFieldModel> fields = [];
  late bool? shared = true;
  late String? displayName;
  late int useCount = 0;
  late int? createdAt = 0;
  late int? timestamp = 0;
  late int? removed = 0;

  SharedTemplateModel toRealmObject() {
    return SharedTemplateModel(
      templateID,
      speciality: speciality,
      userID: userID,
      title: title,
      desc: desc,
      type: type,
      fields:
          fields.map((e) => TemplateFieldModelX.fromJson(e.toJson())).toList(),
      shared: shared,
      displayName: displayName,
      useCount: useCount,
      createdAt: timestamp,
      timestamp: timestamp,
      removed: removed,
    );
  }
}

extension SharedTemplateModelX on SharedTemplateModel {
  static SharedTemplateModel zero() {
    final timestamp = ModelUtils.getTimestamp;
    final templateModel = SharedTemplateModel(
      ModelUtils.uniqueID,
      createdAt: timestamp,
      timestamp: timestamp,
    );

    return templateModel;
  }

  static SharedTemplateModel fromJson(Map<String, dynamic> json) =>
      _$SharedTemplateModelFromJson(json).toRealmObject();

  Map<String, dynamic> toJson() => _$SharedTemplateModelToJson(this);
}
