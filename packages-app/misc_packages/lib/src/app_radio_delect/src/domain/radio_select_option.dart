import 'package:flutter/material.dart';

/// A model class used to represent a selectable item.
@immutable
class RadioSelectOption<T> {
  const RadioSelectOption({
    required this.value,
    this.title,
    this.subTitle,
    this.trailing,
    this.selected = false,
    this.editable = false,
  });

  final T value;
  final String? title;
  final Widget? subTitle;
  final Widget? trailing;
  final bool selected;
  final bool editable;

  RadioSelectOption<T> copyWith({
    T? value,
    String? title,
    Widget? subTitle,
    Widget? trailing,
    bool? selected,
    bool? editable,
  }) {
    return RadioSelectOption<T>(
      value: value ?? this.value,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      trailing: trailing ?? this.trailing,
      selected: selected ?? this.selected,
      editable: editable ?? this.editable,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is RadioSelectOption && other.value == value;

  @override
  int get hashCode => value.hashCode;
}
