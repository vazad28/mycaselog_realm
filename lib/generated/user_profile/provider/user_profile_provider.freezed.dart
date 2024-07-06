// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../../user_profile/provider/user_profile_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserProfileEvent {
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateDisplayName value) updateDisplayName,
    required TResult Function(_UpdateSpeciality value) updateSpeciality,
    required TResult Function(_UpdateSubSpeciality value) updateSubSpeciality,
    required TResult Function(_UploadAvatar value) uploadAvatar,
    required TResult Function(_UpdateAbout value) updateAbout,
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$UpdateDisplayNameImpl implements _UpdateDisplayName {
  const _$UpdateDisplayNameImpl(this.displayName);

  @override
  final String? displayName;

  @override
  String toString() {
    return 'UserProfileEvent.updateDisplayName(displayName: $displayName)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateDisplayName value) updateDisplayName,
    required TResult Function(_UpdateSpeciality value) updateSpeciality,
    required TResult Function(_UpdateSubSpeciality value) updateSubSpeciality,
    required TResult Function(_UploadAvatar value) uploadAvatar,
    required TResult Function(_UpdateAbout value) updateAbout,
  }) {
    return updateDisplayName(this);
  }
}

abstract class _UpdateDisplayName implements UserProfileEvent {
  const factory _UpdateDisplayName(final String? displayName) =
      _$UpdateDisplayNameImpl;

  String? get displayName;
}

/// @nodoc

class _$UpdateSpecialityImpl implements _UpdateSpeciality {
  const _$UpdateSpecialityImpl(this.speciality);

  @override
  final String speciality;

  @override
  String toString() {
    return 'UserProfileEvent.updateSpeciality(speciality: $speciality)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateDisplayName value) updateDisplayName,
    required TResult Function(_UpdateSpeciality value) updateSpeciality,
    required TResult Function(_UpdateSubSpeciality value) updateSubSpeciality,
    required TResult Function(_UploadAvatar value) uploadAvatar,
    required TResult Function(_UpdateAbout value) updateAbout,
  }) {
    return updateSpeciality(this);
  }
}

abstract class _UpdateSpeciality implements UserProfileEvent {
  const factory _UpdateSpeciality(final String speciality) =
      _$UpdateSpecialityImpl;

  String get speciality;
}

/// @nodoc

class _$UpdateSubSpecialityImpl implements _UpdateSubSpeciality {
  const _$UpdateSubSpecialityImpl(this.subSpeciality);

  @override
  final String? subSpeciality;

  @override
  String toString() {
    return 'UserProfileEvent.updateSubSpeciality(subSpeciality: $subSpeciality)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateDisplayName value) updateDisplayName,
    required TResult Function(_UpdateSpeciality value) updateSpeciality,
    required TResult Function(_UpdateSubSpeciality value) updateSubSpeciality,
    required TResult Function(_UploadAvatar value) uploadAvatar,
    required TResult Function(_UpdateAbout value) updateAbout,
  }) {
    return updateSubSpeciality(this);
  }
}

abstract class _UpdateSubSpeciality implements UserProfileEvent {
  const factory _UpdateSubSpeciality(final String? subSpeciality) =
      _$UpdateSubSpecialityImpl;

  String? get subSpeciality;
}

/// @nodoc

class _$UploadAvatarImpl implements _UploadAvatar {
  const _$UploadAvatarImpl(this.imageSource);

  @override
  final ImageSource imageSource;

  @override
  String toString() {
    return 'UserProfileEvent.uploadAvatar(imageSource: $imageSource)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateDisplayName value) updateDisplayName,
    required TResult Function(_UpdateSpeciality value) updateSpeciality,
    required TResult Function(_UpdateSubSpeciality value) updateSubSpeciality,
    required TResult Function(_UploadAvatar value) uploadAvatar,
    required TResult Function(_UpdateAbout value) updateAbout,
  }) {
    return uploadAvatar(this);
  }
}

abstract class _UploadAvatar implements UserProfileEvent {
  const factory _UploadAvatar(final ImageSource imageSource) =
      _$UploadAvatarImpl;

  ImageSource get imageSource;
}

/// @nodoc

class _$UpdateAboutImpl implements _UpdateAbout {
  const _$UpdateAboutImpl(this.about);

  @override
  final String? about;

  @override
  String toString() {
    return 'UserProfileEvent.updateAbout(about: $about)';
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_UpdateDisplayName value) updateDisplayName,
    required TResult Function(_UpdateSpeciality value) updateSpeciality,
    required TResult Function(_UpdateSubSpeciality value) updateSubSpeciality,
    required TResult Function(_UploadAvatar value) uploadAvatar,
    required TResult Function(_UpdateAbout value) updateAbout,
  }) {
    return updateAbout(this);
  }
}

abstract class _UpdateAbout implements UserProfileEvent {
  const factory _UpdateAbout(final String? about) = _$UpdateAboutImpl;

  String? get about;
}
