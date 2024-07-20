import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../router/routes/routes.dart';
import '../../../support_data/support_data.dart';

class SupportDataSettingsSection extends ConsumerWidget {
  const SupportDataSettingsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supportData = ref.watch(supportDataNotifierProvider);
    const padCount = 4;

    return Column(
      children: [
        VerticalSpacer.normal,
        SettingsTile(
          title: 'Surgery Assistants',
          subTitle: S.of(context).mySurgeryAssistants,
          leading: const Icon(Icons.assistant),
          trailing: SettingsTrailing(
            text: supportData.assistants.length.toString().padRight(padCount),
            icon: const Icon(Icons.navigate_next),
          ),
          onTap: () {
            const AssistantsRoute().push<void>(context);
          },
        ),
        SettingsTile(
          title: S.of(context).locations,
          subTitle: S.of(context).surgeryLocationSubTitle,
          leading: const Icon(Icons.map),
          trailing: SettingsTrailing(
            text: supportData.surgeryLocations.length
                .toString()
                .padRight(padCount),
            icon: const Icon(Icons.navigate_next),
          ),
          onTap: () {
            const SurgeryLocationsRoute().push<void>(context);
          },
        ),
        SettingsTile(
          title: S.of(context).anesthesiaBlock,
          subTitle: 'List of anesthesia blocks',
          leading: const Icon(Icons.personal_injury),
          trailing: SettingsTrailing(
            text: supportData.anesthesiaBlocks.length
                .toString()
                .padRight(padCount),
            icon: const Icon(Icons.navigate_next),
          ),
          onTap: () {
            const AnesthesiaBlocksSettingsRoute().push<void>(context);
          },
        ),
        // SettingsTile(
        //   title: 'My referring physicians',
        //   subTitle: 'Primary or referring physicians',
        //   leading: const Icon(Icons.medical_services),
        //   trailing: SettingsTrailing(
        //     text: (supportData.pcps?.where((e) => e.removed == 0).length ??
        //             0)
        //         .toString()
        //         .padRight(padCount),
        //     icon: const Icon(Icons.navigate_next),
        //   ),
        //   onTap: () {
        //     //const PcpListRoute().push<void>(context);
        //   },
        //),
      ],
    );
  }
}
