import 'package:realm/realm.dart';

part 'case_model.realm.dart';

@RealmModel()
class _CaseModel {
  @PrimaryKey()
  late ObjectId id;
  late String diagnosis;
  late String surgery;
  late DateTime surgeryDate;
  late int? timestamp;
}
