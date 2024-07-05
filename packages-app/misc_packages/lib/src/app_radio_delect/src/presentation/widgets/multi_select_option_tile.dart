import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../../domain/radio_select_option.dart';

class MultiSelectOptionTile<T> extends StatelessWidget {
  const MultiSelectOptionTile({
    required this.item,
    required this.onChanged,
    super.key,
    this.trailing,
    this.leading,
  });
  final RadioSelectOption<T> item;
  final Widget? trailing;
  final Widget? leading;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final iconColor =
        item.selected ? colorScheme.primary : colorScheme.shadow.withAlpha(10);

    return ListTile(
      dense: item.subTitle != null,
      title: Text(
        (item.title ?? item.value.toString()).titleCase,
        style: item.subTitle == null
            ? textTheme.titleMedium
            : textTheme.titleLarge,
      ),
      subtitle: item.subTitle,
      trailing: trailing ??
          Icon(
            Icons.square,
            color: iconColor,
            size: 16,
          ),
      onTap: () => onChanged(!item.selected),
    );
  }
}
