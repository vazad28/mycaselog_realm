import 'package:flutter/material.dart';

class ListFilterBar extends StatelessWidget implements PreferredSizeWidget {
  const ListFilterBar({
    required this.onChanged,
    required this.hintText,
    super.key,
  });

  final void Function(String value) onChanged;
  final String hintText;

  @override
  Size get preferredSize => const Size.fromHeight(kMinInteractiveDimension);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return PreferredSize(
      preferredSize: const Size(double.infinity, kMinInteractiveDimension),
      child: ColoredBox(
        color: colorScheme.surfaceContainerHighest,
        child: TextFormField(
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            prefixIcon: Icon(
              Icons.filter_list,
              size: 24,
              color: colorScheme.outlineVariant,
            ),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
