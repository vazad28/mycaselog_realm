import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../../domain/radio_select_option.dart';

class RadioSelectOptionTile<T> extends StatelessWidget {
  const RadioSelectOptionTile({
    required this.item,
    required this.onTap,
    super.key,
    this.trailing,
    this.leading,
  });
  final RadioSelectOption<T> item;
  final Widget? trailing;
  final Widget? leading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final iconColor =
        item.selected ? colorScheme.primary : colorScheme.shadow.withAlpha(10);

    return ListTile(
      dense: item.subTitle != null,
      //contentPadding: const EdgeInsets.only(right: 16, left: 4),
      title: Text(
        (item.title ?? item.value.toString()).titleCase,
        style: textTheme.titleMedium,
      ),
      subtitle: item.subTitle,
      //leading: leading ?? const SizedBox(width: 16),
      trailing: trailing ??
          Icon(
            Icons.circle,
            color: iconColor,
            size: 20,
          ),
      onTap: onTap,
    );
  }
}
