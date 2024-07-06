import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:misc_packages/misc_packages.dart';
import 'package:recase/recase.dart';

class AddFieldOptionBar extends StatelessWidget {
  const AddFieldOptionBar({required this.onAddOption, super.key});

  final void Function(String) onAddOption;

  @override
  Widget build(BuildContext context) {
    final Widget button = FilledButton.icon(
      onPressed: () async {
        final res = await context.showInputDialog<String?>(
          title: S.of(context).addOption,
          value: '',
        );
        if (res?.isEmpty ?? true) return;
        onAddOption.call(res!);
      },
      icon: const Icon(Icons.add),
      label: Text(S.of(context).addOption.titleCase),
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );

    final Widget tile = Row(
      children: [
        HorizontalSpacer.normal,
        Expanded(
          child: Text(S.of(context).options.toUpperCase()),
        ),
        button,
        HorizontalSpacer.normal,
      ],
    );

    return SizedBox(
      height: kMinInteractiveDimension,
      child: ColoredBox(
        color: context.colorScheme.surfaceContainerHighest,
        child: tile,
      ),
    );
  }
}
