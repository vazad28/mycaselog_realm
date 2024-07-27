import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';

import '../../../core/app_providers.dart';
import '../../../core/core.dart';

part './tiles/theme_mode_tile.dart';

class ThemeSettingsSection extends StatelessWidget {
  const ThemeSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        VerticalSpacer.normal,
        ThemeModeSettingTile(),
        // LanguageSettingTile(),
        // FontSettingTile(),
        //AppColorTile(),
      ],
    );
  }
}
