import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

/// Tile for the template list
class FieldOptionTile extends StatelessWidget {
  const FieldOptionTile({
    required this.entry,
    required this.onDelete,
    required this.onTap,
    super.key,
  });

  final MapEntry<int, dynamic> entry;
  final VoidCallback onDelete;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    /// tile row
    final Widget tile = InkWell(
      onTap: onTap,
      child: _FieldOptionTile(entry).paddingAll(AppSpacing.md),
    );

    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => onDelete(),
      background: ColoredBox(
        color: context.colorScheme.error,
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
          dense: true,
          trailing: Icon(
            Icons.delete,
            color: context.colorScheme.onError,
            size: 24,
          ),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border(
              bottom:
                  BorderSide(color: Theme.of(context).dividerColor, width: 0.5),
            ),
          ),
          child: tile,
        ),
      ),
    );
  }
}

class _FieldOptionTile extends StatelessWidget {
  const _FieldOptionTile(
    this.entry,
  );

  final MapEntry<int, dynamic> entry;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                entry.value.toString().sentenceCase,
                style: context.textTheme.bodyLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
