import 'package:app_annotations/app_annotations.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

class CaseDetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CaseDetailsAppBar({
    required this.tabController,
    required this.innerBoxIsScrolled,
    required this.onMoreMenuTap,
    super.key,
  });

  final TabController tabController;
  final bool innerBoxIsScrolled;
  final void Function() onMoreMenuTap;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      titleSpacing: 0,
      elevation: 2,
      floating: true,
      pinned: true,
      snap: true,
      //expandedHeight: kToolbarHeight * 2,
      title: Text(S.of(context).caseDetails.titleCase),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert),
          //onPressed: null,
          onPressed: onMoreMenuTap,
        ),
      ],
      bottom: TabBar(
        controller: tabController,
        labelColor: context.colorScheme.secondary,
        unselectedLabelColor: context.colorScheme.onSurface,
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: [
          Tab(
            text: CaseDetailsTabsEnum.basic.name.titleCase.toUpperCase(),
          ),
          Tab(
            text: CaseDetailsTabsEnum.template.name.titleCase.toUpperCase(),
          ),
          Tab(
            text: CaseDetailsTabsEnum.timeline.name.titleCase.toUpperCase(),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
