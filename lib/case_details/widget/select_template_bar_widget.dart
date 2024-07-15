import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

class SelectTemplateBarWidget extends StatelessWidget {
  const SelectTemplateBarWidget({required this.title, super.key});

  final String? title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final Widget child = SizedBox(
      height: kMinInteractiveDimension,
      child: ColoredBox(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            HorizontalSpacer.large,
            Text(
              S.of(context).surgeryTemplate,
              style: theme.textTheme.bodyMedium,
            ),
            Expanded(
              child: Text(
                (title ?? S.of(context).select).sentenceCase,
                textAlign: TextAlign.end,
                style: theme.textTheme.bodyMedium,
              ),
            ),
            HorizontalSpacer.large,
          ],
        ),
      ),
    );
    return child;
  }
}
