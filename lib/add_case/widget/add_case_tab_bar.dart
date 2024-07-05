import 'package:app_annotations/app_annotations.dart';
import 'package:app_extensions/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

class AddCaseTabBar extends StatelessWidget implements PreferredSizeWidget {
  const AddCaseTabBar({
    required this.tabController,
    super.key,
  });

  final TabController tabController;

  @override
  Size get preferredSize => const Size.fromHeight(kMinInteractiveDimension);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    return TabBar(
      controller: tabController,
      labelColor: colorScheme.secondary,
      unselectedLabelColor: colorScheme.onSurfaceVariant,
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: [
        Tab(
          text: CaseDetailsTabsEnum.values.names[0].titleCase.toUpperCase(),
        ),
        Tab(
          text: CaseDetailsTabsEnum.values.names[1].titleCase.toUpperCase(),
        ),
      ],
    );
  }
}
