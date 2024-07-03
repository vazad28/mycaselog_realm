import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

extension InputDecorationsExt on BuildContext {
  InputDecoration inputDecorOutline({
    String? labelText,
    Icon? suffixIcon,
    String? suffixText,
    Widget? suffix,
    EdgeInsets? contentPadding,
    String? hintText,
    String? errorText,
    FloatingLabelBehavior? labelBehavior = FloatingLabelBehavior.always,
  }) =>
      InputDecoration(
        isDense: true,
        labelText: labelText?.titleCase,
        hintText: (hintText ?? labelText) ?? '',
        suffixIcon: suffixIcon,
        suffixText: suffixText,
        suffix: suffix,
        errorText: errorText,
        contentPadding: contentPadding,
        floatingLabelBehavior: labelBehavior,
        suffixIconConstraints: const BoxConstraints.tightFor(width: 28),
      );

  InputDecoration inputDecorOutlineNoBorder({
    String? labelText,
    String? hintText,
  }) =>
      InputDecoration(
        isDense: true,
        labelText: labelText,
        hintText: hintText?.sentenceCase,
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      );
}
