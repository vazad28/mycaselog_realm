part of '../general_section.dart';

class CaseNavigateToTile extends ConsumerWidget with SettingsMixin {
  const CaseNavigateToTile({super.key});

  static List<RadioSelectOption<CaseDetailsTabsEnum>> items = [
    RadioSelectOption(
      title: CaseDetailsTabsEnum.basic.name.titleCase,
      subTitle: Text('Basic case data tab'.hardcoded),
      value: CaseDetailsTabsEnum.basic,
    ),
    RadioSelectOption(
      title: CaseDetailsTabsEnum.template.name.titleCase,
      subTitle: Text('Template case data tab'.hardcoded),
      value: CaseDetailsTabsEnum.template,
    ),
    RadioSelectOption(
      title: CaseDetailsTabsEnum.timeline.name.titleCase,
      subTitle: Text('Case timeline data tab'.hardcoded),
      value: CaseDetailsTabsEnum.timeline,
    ),
    RadioSelectOption(
      title: CaseDetailsTabsEnum.dynamic.name.titleCase,
      subTitle: Text('Last case details tab used'.hardcoded),
      value: CaseDetailsTabsEnum.dynamic,
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caseTileNavigate = ref.watch(
      settingsProvider.select((value) => value.caseTileNavigate),
    );

    final caseTileNavigateTo = caseTileNavigate == 0
        ? CaseDetailsTabsEnum.basic
        : CaseDetailsTabsEnum.values[caseTileNavigate];

    return SettingsTile(
      leading: const Icon(Icons.menu_open_sharp),
      title: S.of(context).surgeryDetailLandingTab.titleCase,
      subTitle: caseTileNavigateTo.name.titleCase,
      onTap: () {
        context
            .openRadioSelectModal(
          rootContext: AppVars.rootContext,
          modal: RadioSelectModal<CaseDetailsTabsEnum>(
            selectedValue: caseTileNavigateTo,
            items: items,
            title: S.of(context).surgeryDetailLandingTab.titleCase,
          ),
        )
            .then((radioSelectItem) {
          if (radioSelectItem == null) return;

          updateSettings(
              ref, getSettings(ref)..caseTileNavigate = radioSelectItem.index);
        });
      },
    );
  }
}
