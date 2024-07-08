import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';

import '../../../router/routes/settings_routes.dart';
import '../../provider/app_settings_provider.dart';

class TemplatesSettingsSection extends StatelessWidget {
  const TemplatesSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    const padCount = 4;
    return Column(
      children: [
        VerticalSpacer.normal,
        SettingsTile(
          title: S.of(context).templates,
          subTitle: 'List of my templates',
          leading: const Icon(Icons.wysiwyg),
          trailing: const _TemplatesCount(padCount),
          onTap: () {
            const TemplatesRoute().push<void>(context);
          },
        ),
        SettingsTile(
          title: S.of(context).activeBasicDataFields.titleCase,
          subTitle: S.of(context).activeBasicDataFieldsSubTitle,
          leading: const Icon(Icons.local_activity_rounded),
          onTap: () {
            const ActivableFieldsRoute().push<void>(context);
          },
        ),
      ],
    );
  }
}

class _TemplatesCount extends ConsumerWidget {
  const _TemplatesCount(this.padCount);

  final int padCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(templatesCountProvider);

    return SettingsTrailing(
      text: count.toString().padRight(padCount),
      icon: const Icon(Icons.navigate_next),
    );
  }
}
