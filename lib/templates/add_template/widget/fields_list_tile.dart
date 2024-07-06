// ignore_for_file: require_trailing_commas

import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

/// Tile for the template fieldslist
class TemplateFieldTile extends StatelessWidget {
  const TemplateFieldTile({
    required this.templateField,
    super.key,
    this.onDelete,
    this.onTap,
  });

  final VoidCallback? onDelete;
  final VoidCallback? onTap;
  final TemplateFieldModel templateField;

  @override
  Widget build(BuildContext context) {
    /// tile row
    final Widget tile = _TemplateFieldTile(templateField);

    final Widget dismissible = Dismissible(
      key: ObjectKey(templateField.fieldID),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => onDelete?.call(),
      background: ColoredBox(
        color: context.colorScheme.error,
        child: ListTile(
          trailing:
              Icon(Icons.delete, color: context.colorScheme.onError, size: 36),
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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: tile,
          ),
        ),
      ),
    );

    return onDelete == null
        ? AbsorbPointer(
            child: dismissible,
          )
        : dismissible;
  }
}

class _TemplateFieldTile extends StatelessWidget {
  const _TemplateFieldTile(this.templateField);

  final TemplateFieldModel templateField;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    var subtitle = S.of(context).noDefaultValue;

    if (templateField.defaultValue != null &&
        templateField.defaultValue.toString().isNotEmpty) {
      subtitle = templateField.defaultValue.toString();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                templateField.title?.titleCase ?? S.of(context).noTitle,
                style: theme.textTheme.bodyLarge,
              ),
              Text(
                subtitle,
                style: theme.textTheme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        ),
        SizedBox(
          child: Text(
            templateField.fieldType.name,
            style: theme.textTheme.bodySmall,
          ),
        ),
        const SizedBox(width: 8),
        const Icon(Icons.drag_handle)
      ],
    );
  }
}
