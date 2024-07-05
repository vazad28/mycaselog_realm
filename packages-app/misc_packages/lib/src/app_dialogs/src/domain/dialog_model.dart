import 'package:app_l10n/app_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dialog_model.freezed.dart';

@freezed
class DialogModel with _$DialogModel {
  const factory DialogModel({
    required Widget content,
    String? title,
    String? cancelActionText,
    String? defaultActionText,
  }) = _DialogModel;

  /// info dialog model
  factory DialogModel.info(Widget content, [String? title]) => DialogModel(
        title: title,
        content: content,
        defaultActionText: S.current.ok,
      );

  /// confirm dialog model
  factory DialogModel.confirm(Widget content, [String? title]) => DialogModel(
        title: title,
        content: content,
        defaultActionText: S.current.yes,
        cancelActionText: S.current.cancel,
      );
}

@freezed
class InputDialogModel with _$InputDialogModel {
  const factory InputDialogModel({
    String? title,
    String? cancelActionText,
    String? defaultActionText,
    @Default(false) bool obscureText,
    String? value,
    String? placeholderText,
    TextCapitalization? textCapitalization,
    List<TextInputFormatter>? inputFormatters,
    @Default(false) bool multiline,
  }) = _InputDialogModel;
}
