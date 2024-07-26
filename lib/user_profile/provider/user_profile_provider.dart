import 'dart:io';

import 'package:app_models/app_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart' show ImagePicker, ImageSource;
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/app_providers.dart';
import '../../core/app_services.dart';

part '../../generated/user_profile/provider/user_profile_provider.freezed.dart';
part '../../generated/user_profile/provider/user_profile_provider.g.dart';

/// ////////////////////////////////////////////////////////////////////
/// Events and Mixin
/// ////////////////////////////////////////////////////////////////////

@Freezed(
  copyWith: false,
  equal: false,
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions(maybeMap: false, mapOrNull: false),
)
class UserProfileEvent with _$UserProfileEvent {
  const factory UserProfileEvent.updateDisplayName(String? displayName) =
      _UpdateDisplayName;

  const factory UserProfileEvent.updateSpeciality(String speciality) =
      _UpdateSpeciality;

  const factory UserProfileEvent.updateSubSpeciality(String? subSpeciality) =
      _UpdateSubSpeciality;

  const factory UserProfileEvent.uploadAvatar(ImageSource imageSource) =
      _UploadAvatar;

  const factory UserProfileEvent.updateAbout(String? about) = _UpdateAbout;
}

mixin UserProfileEventMixin {
  void updateDisplayName(WidgetRef ref, String? displayName) =>
      ref.watch(userProfileNotifierProvider.notifier).on(
            UserProfileEvent.updateDisplayName(displayName),
          );
  void updateUserSpeciality(WidgetRef ref, String speciality) =>
      ref.watch(userProfileNotifierProvider.notifier).on(
            UserProfileEvent.updateSpeciality(speciality),
          );
  void updateSubSpeciality(WidgetRef ref, String? subSpeciality) =>
      ref.watch(userProfileNotifierProvider.notifier).on(
            UserProfileEvent.updateSubSpeciality(subSpeciality),
          );
  void uploadAvatar(WidgetRef ref, ImageSource imageSource) => ref
      .watch(userProfileNotifierProvider.notifier)
      .on(UserProfileEvent.uploadAvatar(imageSource));

  void updateAbout(WidgetRef ref, String? aboutText) =>
      ref.watch(userProfileNotifierProvider.notifier).on(
            UserProfileEvent.updateAbout(aboutText),
          );
}

mixin UserProfileStateMixin {
  String? userProfilePhotoUrl(WidgetRef ref) => ref.watch(
        userProfileNotifierProvider.select((value) => value.photoUrl),
      );
  String? userDisplayName(WidgetRef ref) => ref.watch(
        userProfileNotifierProvider.select((value) => value.displayName),
      );

  String? userSpeciality(WidgetRef ref) => ref.watch(
        userProfileNotifierProvider.select((value) => value.speciality),
      );
  String? userSubSpeciality(WidgetRef ref) => ref.watch(
        userProfileNotifierProvider.select((value) => value.subSpeciality),
      );
  int? userMemberSince(WidgetRef ref) => ref.watch(
        userProfileNotifierProvider.select((value) => value.creationTime),
      );
  String? userAboutMe(WidgetRef ref) => ref.watch(
        userProfileNotifierProvider.select((value) => value.about),
      );
}

/// ////////////////////////////////////////////////////////////////////
/// Main Providers
/// ////////////////////////////////////////////////////////////////////
@riverpod
class UserProfileNotifier extends _$UserProfileNotifier with LoggerMixin {
  String get userID => ref.watch(authenticationUserProvider).id;

  @override
  UserModel build() {
    final sub = ref
        .watch(dbProvider)
        .userCollection
        .getSingle(userID)
        ?.changes
        .listen((data) {
      state = UserModelX.fromJson(data.object.toJson());
    });

    ref.onDispose(() => sub?.cancel());

    return UserModelX.zero(userID: userID);
  }

  /// Map events to state
  void on(UserProfileEvent event) {
    event.map(
      updateDisplayName: (v) => _updateUserModel(
        state..displayName = v.displayName,
      ),
      updateSpeciality: (v) => _updateUserModel(
        state..speciality = v.speciality,
      ),
      updateSubSpeciality: (v) => _updateUserModel(
        state..subSpeciality = v.subSpeciality,
      ),
      uploadAvatar: (v) => _uploadAvatar(
        v.imageSource,
      ),
      updateAbout: (v) => _updateUserModel(
        state..about = v.about,
      ),
    );
  }

  /// Save user model with any updates
  void _updateUserModel(UserModel userModel) {
    /// we are not saving data if the user is anonymous as can happen on logout
    if (userModel.userID.isEmpty) return;
    ref.read(dbProvider).userCollection.add(userModel.userID, userModel);
  }

  /// Upload user avatar photo
  Future<void> _uploadAvatar(ImageSource imageSource) async {
    final localFile = await ImagePicker().pickImage(
      source: imageSource,
      imageQuality: 90,
      maxHeight: 600,
      maxWidth: 600,
    );

    if (localFile == null) return; //like a pick was cancelled

    final file = File(localFile.path);

    await ref
        .watch(dbProvider)
        .storageCollection
        .uploadAvatar(file)
        .then((value) {
      ref.watch(dialogServiceProvider).showSnackBar('success');
      state = state..photoUrl = value;
    }).catchError((err) async {
      await Future<void>.delayed(const Duration(milliseconds: 300));
      ref
          .watch(dialogServiceProvider)
          .showSnackBar('Error in uploading new avatar');
    });
  }
}
