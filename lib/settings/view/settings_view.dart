import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

import '../sections/sections.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          /// Spacer
          VerticalSpacer.large,

          /// main setting - All theme and Templates setting
          SettingsTileHeader(title: context.l10n.themeSettings.titleCase),
          const SettingsTileDivider(full: true),
          const ThemeSettingsSection(),

          /// Spacer
          VerticalSpacer.large,

          /// General app settings
          SettingsTileHeader(title: S.of(context).generalSettings.titleCase),
          const SettingsTileDivider(full: true),
          const GeneralSettingsSection(),

          /// Spacer
          VerticalSpacer.large,

          /// Templates settings
          SettingsTileHeader(title: S.of(context).surgeryTemplates.titleCase),
          const SettingsTileDivider(full: true),
          const TemplatesSettingsSection(),

          /// Spacer
          VerticalSpacer.large,

          /// Support app settings
          SettingsTileHeader(
            title: S.of(context).supportDataSettings.titleCase,
          ),
          const SettingsTileDivider(full: true),
          const SupportDataSettingsSection(),

          /// Spacing
          VerticalSpacer.large,

          /// Sync app settings
          SettingsTileHeader(title: S.of(context).databaseSettings.titleCase),
          const SettingsTileDivider(full: true),
          const SyncSettingsSection(),
          VerticalSpacer.large,
        ],
      ),
    );
  }
}
