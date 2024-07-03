// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dialog_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DialogModel {
  Widget get content => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get cancelActionText => throw _privateConstructorUsedError;
  String? get defaultActionText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DialogModelCopyWith<DialogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DialogModelCopyWith<$Res> {
  factory $DialogModelCopyWith(
          DialogModel value, $Res Function(DialogModel) then) =
      _$DialogModelCopyWithImpl<$Res, DialogModel>;
  @useResult
  $Res call(
      {Widget content,
      String? title,
      String? cancelActionText,
      String? defaultActionText});
}

/// @nodoc
class _$DialogModelCopyWithImpl<$Res, $Val extends DialogModel>
    implements $DialogModelCopyWith<$Res> {
  _$DialogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? title = freezed,
    Object? cancelActionText = freezed,
    Object? defaultActionText = freezed,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Widget,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelActionText: freezed == cancelActionText
          ? _value.cancelActionText
          : cancelActionText // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultActionText: freezed == defaultActionText
          ? _value.defaultActionText
          : defaultActionText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DialogModelImplCopyWith<$Res>
    implements $DialogModelCopyWith<$Res> {
  factory _$$DialogModelImplCopyWith(
          _$DialogModelImpl value, $Res Function(_$DialogModelImpl) then) =
      __$$DialogModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Widget content,
      String? title,
      String? cancelActionText,
      String? defaultActionText});
}

/// @nodoc
class __$$DialogModelImplCopyWithImpl<$Res>
    extends _$DialogModelCopyWithImpl<$Res, _$DialogModelImpl>
    implements _$$DialogModelImplCopyWith<$Res> {
  __$$DialogModelImplCopyWithImpl(
      _$DialogModelImpl _value, $Res Function(_$DialogModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? title = freezed,
    Object? cancelActionText = freezed,
    Object? defaultActionText = freezed,
  }) {
    return _then(_$DialogModelImpl(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as Widget,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelActionText: freezed == cancelActionText
          ? _value.cancelActionText
          : cancelActionText // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultActionText: freezed == defaultActionText
          ? _value.defaultActionText
          : defaultActionText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$DialogModelImpl implements _DialogModel {
  const _$DialogModelImpl(
      {required this.content,
      this.title,
      this.cancelActionText,
      this.defaultActionText});

  @override
  final Widget content;
  @override
  final String? title;
  @override
  final String? cancelActionText;
  @override
  final String? defaultActionText;

  @override
  String toString() {
    return 'DialogModel(content: $content, title: $title, cancelActionText: $cancelActionText, defaultActionText: $defaultActionText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DialogModelImpl &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.cancelActionText, cancelActionText) ||
                other.cancelActionText == cancelActionText) &&
            (identical(other.defaultActionText, defaultActionText) ||
                other.defaultActionText == defaultActionText));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, content, title, cancelActionText, defaultActionText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DialogModelImplCopyWith<_$DialogModelImpl> get copyWith =>
      __$$DialogModelImplCopyWithImpl<_$DialogModelImpl>(this, _$identity);
}

abstract class _DialogModel implements DialogModel {
  const factory _DialogModel(
      {required final Widget content,
      final String? title,
      final String? cancelActionText,
      final String? defaultActionText}) = _$DialogModelImpl;

  @override
  Widget get content;
  @override
  String? get title;
  @override
  String? get cancelActionText;
  @override
  String? get defaultActionText;
  @override
  @JsonKey(ignore: true)
  _$$DialogModelImplCopyWith<_$DialogModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InputDialogModel {
  String? get title => throw _privateConstructorUsedError;
  String? get cancelActionText => throw _privateConstructorUsedError;
  String? get defaultActionText => throw _privateConstructorUsedError;
  bool get obscureText => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  String? get placeholderText => throw _privateConstructorUsedError;
  TextCapitalization? get textCapitalization =>
      throw _privateConstructorUsedError;
  List<TextInputFormatter>? get inputFormatters =>
      throw _privateConstructorUsedError;
  bool get multiline => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InputDialogModelCopyWith<InputDialogModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InputDialogModelCopyWith<$Res> {
  factory $InputDialogModelCopyWith(
          InputDialogModel value, $Res Function(InputDialogModel) then) =
      _$InputDialogModelCopyWithImpl<$Res, InputDialogModel>;
  @useResult
  $Res call(
      {String? title,
      String? cancelActionText,
      String? defaultActionText,
      bool obscureText,
      String? value,
      String? placeholderText,
      TextCapitalization? textCapitalization,
      List<TextInputFormatter>? inputFormatters,
      bool multiline});
}

/// @nodoc
class _$InputDialogModelCopyWithImpl<$Res, $Val extends InputDialogModel>
    implements $InputDialogModelCopyWith<$Res> {
  _$InputDialogModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? cancelActionText = freezed,
    Object? defaultActionText = freezed,
    Object? obscureText = null,
    Object? value = freezed,
    Object? placeholderText = freezed,
    Object? textCapitalization = freezed,
    Object? inputFormatters = freezed,
    Object? multiline = null,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelActionText: freezed == cancelActionText
          ? _value.cancelActionText
          : cancelActionText // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultActionText: freezed == defaultActionText
          ? _value.defaultActionText
          : defaultActionText // ignore: cast_nullable_to_non_nullable
              as String?,
      obscureText: null == obscureText
          ? _value.obscureText
          : obscureText // ignore: cast_nullable_to_non_nullable
              as bool,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      placeholderText: freezed == placeholderText
          ? _value.placeholderText
          : placeholderText // ignore: cast_nullable_to_non_nullable
              as String?,
      textCapitalization: freezed == textCapitalization
          ? _value.textCapitalization
          : textCapitalization // ignore: cast_nullable_to_non_nullable
              as TextCapitalization?,
      inputFormatters: freezed == inputFormatters
          ? _value.inputFormatters
          : inputFormatters // ignore: cast_nullable_to_non_nullable
              as List<TextInputFormatter>?,
      multiline: null == multiline
          ? _value.multiline
          : multiline // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InputDialogModelImplCopyWith<$Res>
    implements $InputDialogModelCopyWith<$Res> {
  factory _$$InputDialogModelImplCopyWith(_$InputDialogModelImpl value,
          $Res Function(_$InputDialogModelImpl) then) =
      __$$InputDialogModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String? cancelActionText,
      String? defaultActionText,
      bool obscureText,
      String? value,
      String? placeholderText,
      TextCapitalization? textCapitalization,
      List<TextInputFormatter>? inputFormatters,
      bool multiline});
}

/// @nodoc
class __$$InputDialogModelImplCopyWithImpl<$Res>
    extends _$InputDialogModelCopyWithImpl<$Res, _$InputDialogModelImpl>
    implements _$$InputDialogModelImplCopyWith<$Res> {
  __$$InputDialogModelImplCopyWithImpl(_$InputDialogModelImpl _value,
      $Res Function(_$InputDialogModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? cancelActionText = freezed,
    Object? defaultActionText = freezed,
    Object? obscureText = null,
    Object? value = freezed,
    Object? placeholderText = freezed,
    Object? textCapitalization = freezed,
    Object? inputFormatters = freezed,
    Object? multiline = null,
  }) {
    return _then(_$InputDialogModelImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelActionText: freezed == cancelActionText
          ? _value.cancelActionText
          : cancelActionText // ignore: cast_nullable_to_non_nullable
              as String?,
      defaultActionText: freezed == defaultActionText
          ? _value.defaultActionText
          : defaultActionText // ignore: cast_nullable_to_non_nullable
              as String?,
      obscureText: null == obscureText
          ? _value.obscureText
          : obscureText // ignore: cast_nullable_to_non_nullable
              as bool,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      placeholderText: freezed == placeholderText
          ? _value.placeholderText
          : placeholderText // ignore: cast_nullable_to_non_nullable
              as String?,
      textCapitalization: freezed == textCapitalization
          ? _value.textCapitalization
          : textCapitalization // ignore: cast_nullable_to_non_nullable
              as TextCapitalization?,
      inputFormatters: freezed == inputFormatters
          ? _value._inputFormatters
          : inputFormatters // ignore: cast_nullable_to_non_nullable
              as List<TextInputFormatter>?,
      multiline: null == multiline
          ? _value.multiline
          : multiline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$InputDialogModelImpl implements _InputDialogModel {
  const _$InputDialogModelImpl(
      {this.title,
      this.cancelActionText,
      this.defaultActionText,
      this.obscureText = false,
      this.value,
      this.placeholderText,
      this.textCapitalization,
      final List<TextInputFormatter>? inputFormatters,
      this.multiline = false})
      : _inputFormatters = inputFormatters;

  @override
  final String? title;
  @override
  final String? cancelActionText;
  @override
  final String? defaultActionText;
  @override
  @JsonKey()
  final bool obscureText;
  @override
  final String? value;
  @override
  final String? placeholderText;
  @override
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? _inputFormatters;
  @override
  List<TextInputFormatter>? get inputFormatters {
    final value = _inputFormatters;
    if (value == null) return null;
    if (_inputFormatters is EqualUnmodifiableListView) return _inputFormatters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final bool multiline;

  @override
  String toString() {
    return 'InputDialogModel(title: $title, cancelActionText: $cancelActionText, defaultActionText: $defaultActionText, obscureText: $obscureText, value: $value, placeholderText: $placeholderText, textCapitalization: $textCapitalization, inputFormatters: $inputFormatters, multiline: $multiline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputDialogModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.cancelActionText, cancelActionText) ||
                other.cancelActionText == cancelActionText) &&
            (identical(other.defaultActionText, defaultActionText) ||
                other.defaultActionText == defaultActionText) &&
            (identical(other.obscureText, obscureText) ||
                other.obscureText == obscureText) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.placeholderText, placeholderText) ||
                other.placeholderText == placeholderText) &&
            (identical(other.textCapitalization, textCapitalization) ||
                other.textCapitalization == textCapitalization) &&
            const DeepCollectionEquality()
                .equals(other._inputFormatters, _inputFormatters) &&
            (identical(other.multiline, multiline) ||
                other.multiline == multiline));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      cancelActionText,
      defaultActionText,
      obscureText,
      value,
      placeholderText,
      textCapitalization,
      const DeepCollectionEquality().hash(_inputFormatters),
      multiline);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InputDialogModelImplCopyWith<_$InputDialogModelImpl> get copyWith =>
      __$$InputDialogModelImplCopyWithImpl<_$InputDialogModelImpl>(
          this, _$identity);
}

abstract class _InputDialogModel implements InputDialogModel {
  const factory _InputDialogModel(
      {final String? title,
      final String? cancelActionText,
      final String? defaultActionText,
      final bool obscureText,
      final String? value,
      final String? placeholderText,
      final TextCapitalization? textCapitalization,
      final List<TextInputFormatter>? inputFormatters,
      final bool multiline}) = _$InputDialogModelImpl;

  @override
  String? get title;
  @override
  String? get cancelActionText;
  @override
  String? get defaultActionText;
  @override
  bool get obscureText;
  @override
  String? get value;
  @override
  String? get placeholderText;
  @override
  TextCapitalization? get textCapitalization;
  @override
  List<TextInputFormatter>? get inputFormatters;
  @override
  bool get multiline;
  @override
  @JsonKey(ignore: true)
  _$$InputDialogModelImplCopyWith<_$InputDialogModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
