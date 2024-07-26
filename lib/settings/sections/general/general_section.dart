import 'package:app_annotations/app_annotations.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misc_packages/misc_packages.dart';
import 'package:recase/recase.dart';

import '../../../core/app_vars.dart';
import '../../settings.dart';
part 'tiles/case_navigate_to_tile.dart';
part 'tiles/local_auth_enabled.dart';
part 'tiles/sync_on_app_start_tile.dart';

class GeneralSettingsSection extends ConsumerWidget {
  const GeneralSettingsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [
        VerticalSpacer.normal,
        SyncDataOnAppStartTile(),
        LocalAuthEnabledTile(),
        CaseNavigateToTile(),
      ],
    );
  }
}
