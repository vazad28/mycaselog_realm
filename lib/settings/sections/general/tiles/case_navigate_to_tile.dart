part of '../general_section.dart';

class CaseTNavigateToTile extends ConsumerWidget {
  const CaseTNavigateToTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      appSettingsProvider.select((value) => value.caseTileNavigate),
    );

    final caseTileNavigateTo = state == 0
        ? CaseDetailsTabsEnum.basic
        : CaseDetailsTabsEnum.values[state];

    return SettingsTile(
      leading: const Icon(Icons.menu_open_sharp),
      title: S.of(context).surgeryDetailLandingTab.titleCase,
      subTitle: caseTileNavigateTo.name.titleCase,
      onTap: () {
        final items = [
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

          ref
              .watch(appSettingsProvider.notifier)
              .on(SettingsEvent.updateCaseTileNavigate(radioSelectItem.index));
        });
      },
    );
  }
}
