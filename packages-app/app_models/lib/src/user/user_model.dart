import 'package:json_annotation/json_annotation.dart';
import 'package:realm/realm.dart';

import '../../app_models.dart';

part 'user_model.g.dart';
part 'user_model.realm.dart';

@RealmModel()
@JsonSerializable(explicitToJson: true)
class _UserModel {
  @PrimaryKey()
  late String userID;
  late String? email;
  late String? displayName;
  late String? photoUrl;
  late String? speciality;
  late String? subSpeciality;
  late String? about;
  late int? creationTime;
  late int? lastSignInTime;
  late int timestamp = 0;

  /// SubscriptionPlan
  @MapTo('subscriptionPlan')
  late String? _subscriptionPlan;

  @Ignored()
  SubscriptionPlan get subscriptionPlan {
    return SubscriptionPlan.values
        .byName(_subscriptionPlan ?? SubscriptionPlan.none.name);
  }

  @Ignored()
  set subscriptionPlan(SubscriptionPlan value) =>
      _subscriptionPlan = value.name;

  UserModel toRealmObject() {
    return UserModel(
      userID,
      email: email,
      displayName: displayName,
      photoUrl: photoUrl,
      speciality: speciality,
      subSpeciality: subSpeciality,
      about: about,
      creationTime: creationTime,
      lastSignInTime: lastSignInTime,
      subscriptionPlan: _subscriptionPlan,
      timestamp: timestamp,
    );
  }
}

extension UserModelX on UserModel {
  static UserModel fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json).toRealmObject();

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  static UserModel zero({
    required String userID,
  }) {
    return UserModel(userID, timestamp: ModelUtils.getTimestamp);
  }
}
