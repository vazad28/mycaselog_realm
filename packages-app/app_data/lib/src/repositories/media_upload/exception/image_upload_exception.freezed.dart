// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_upload_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ImageUploadException {
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fileNotFound,
    TResult Function()? compressionFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FileNotFound value) fileNotFound,
    required TResult Function(_CompressionFailure value) compressionFailure,
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageUploadExceptionCopyWith<$Res> {
  factory $ImageUploadExceptionCopyWith(ImageUploadException value,
          $Res Function(ImageUploadException) then) =
      _$ImageUploadExceptionCopyWithImpl<$Res, ImageUploadException>;
}

/// @nodoc
class _$ImageUploadExceptionCopyWithImpl<$Res,
        $Val extends ImageUploadException>
    implements $ImageUploadExceptionCopyWith<$Res> {
  _$ImageUploadExceptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FileNotFoundImplCopyWith<$Res> {
  factory _$$FileNotFoundImplCopyWith(
          _$FileNotFoundImpl value, $Res Function(_$FileNotFoundImpl) then) =
      __$$FileNotFoundImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FileNotFoundImplCopyWithImpl<$Res>
    extends _$ImageUploadExceptionCopyWithImpl<$Res, _$FileNotFoundImpl>
    implements _$$FileNotFoundImplCopyWith<$Res> {
  __$$FileNotFoundImplCopyWithImpl(
      _$FileNotFoundImpl _value, $Res Function(_$FileNotFoundImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FileNotFoundImpl extends _FileNotFound {
  const _$FileNotFoundImpl() : super._();

  @override
  String toString() {
    return 'ImageUploadException.fileNotFound()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FileNotFoundImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fileNotFound,
    TResult Function()? compressionFailure,
    required TResult orElse(),
  }) {
    if (fileNotFound != null) {
      return fileNotFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FileNotFound value) fileNotFound,
    required TResult Function(_CompressionFailure value) compressionFailure,
  }) {
    return fileNotFound(this);
  }
}

abstract class _FileNotFound extends ImageUploadException {
  const factory _FileNotFound() = _$FileNotFoundImpl;
  const _FileNotFound._() : super._();
}

/// @nodoc
abstract class _$$CompressionFailureImplCopyWith<$Res> {
  factory _$$CompressionFailureImplCopyWith(_$CompressionFailureImpl value,
          $Res Function(_$CompressionFailureImpl) then) =
      __$$CompressionFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CompressionFailureImplCopyWithImpl<$Res>
    extends _$ImageUploadExceptionCopyWithImpl<$Res, _$CompressionFailureImpl>
    implements _$$CompressionFailureImplCopyWith<$Res> {
  __$$CompressionFailureImplCopyWithImpl(_$CompressionFailureImpl _value,
      $Res Function(_$CompressionFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CompressionFailureImpl extends _CompressionFailure {
  const _$CompressionFailureImpl() : super._();

  @override
  String toString() {
    return 'ImageUploadException.compressionFailure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CompressionFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fileNotFound,
    TResult Function()? compressionFailure,
    required TResult orElse(),
  }) {
    if (compressionFailure != null) {
      return compressionFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FileNotFound value) fileNotFound,
    required TResult Function(_CompressionFailure value) compressionFailure,
  }) {
    return compressionFailure(this);
  }
}

abstract class _CompressionFailure extends ImageUploadException {
  const factory _CompressionFailure() = _$CompressionFailureImpl;
  const _CompressionFailure._() : super._();
}
