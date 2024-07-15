import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

import '../case_details.dart';

class CaseDetailsView extends StatelessWidget {
  const CaseDetailsView({
    required this.tabController,
    required this.onTap,
    super.key,
  });

  final void Function(int) onTap;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: [
        GestureDetector(
          onTap: () => onTap(0),
          child: const KeepAliveWrapper(
            key: Key('__basicCaseDataTab__'),
            child: CaseDetailsBasicTab(),
          ),
        ),
        GestureDetector(
          onTap: () => onTap(1),
          child: const KeepAliveWrapper(
            key: Key('__templateCaseDataTab__'),
            child: CaseDetailsTemplatedTab(),
          ),
        ),
        const KeepAliveWrapper(
          key: Key('__templateCaseDataTab__'),
          child:
              //CaseTimelinePageStepper()
              CaseDetailsTimelineTab(),
        ),
      ],
    );
  }
}
