import 'package:flutter/material.dart';

class SelectDialogBottomBar extends StatelessWidget {
  const SelectDialogBottomBar({
    required this.onPop,
    super.key,
    this.title,
    this.trailing,
    this.onTitleTap,
  });
  final String? title;
  final Widget? trailing;
  final VoidCallback? onTitleTap;
  final VoidCallback onPop;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final Widget child = Container(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (onTitleTap != null) const Icon(Icons.open_in_new),
          if (onTitleTap != null) const SizedBox(width: 8),
          Expanded(
            child: Text(title ?? '', style: textTheme.titleLarge),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTitleTap?.call();
        Navigator.of(context).pop();
      },
      child: SizedBox(
        height: 96,
        child: child,
      ),
    );
  }
}
