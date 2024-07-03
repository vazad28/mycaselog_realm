import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../cases/cases.dart';
import '../utils/route_animations.dart';

part '../../generated/router/routes/cases_routes.g.dart';

@TypedGoRoute<CasesRoute>(
  path: CasesRoute.path,
  routes: <TypedGoRoute<GoRouteData>>[
    // TypedGoRoute<CaseDetailsRoute>(path: CaseDetailsRoute.path),
    // TypedGoRoute<AddCaseRoute>(path: AddCaseRoute.path),
  ],
)

/// Root tab cases
class CasesRoute extends GoRouteData {
  const CasesRoute();
  static const name = 'cases';
  static const path = '/$name';

  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      FadeTransitionPage(
        key: state.pageKey,
        child: const CasesPage(),
      );
}

// class AddCaseRoute extends GoRouteData {
//   AddCaseRoute(this.$extra, {this.newRecord = false, this.tabIndex = 0})
//       : caseID = $extra.caseID;
//   static const name = 'add_case';
//   static const path = 'case/:caseID/:tabIndex';

//   final CaseModel $extra;
//   final String caseID;
//   final bool newRecord;
//   final int tabIndex;

//   @override
//   Widget build(BuildContext context, GoRouterState state) => AddCasePage(
//         caseModel: $extra,
//         tabIndex: tabIndex,
//         newRecord: newRecord,
//       );
// }

// /// cases details route
// class CaseDetailsRoute extends GoRouteData {
//   CaseDetailsRoute(this.$extra, {this.activeTab}) : caseID = $extra.caseID;

//   static const path = ':caseID/:activeTab';
//   static const name = 'case_details';

//   final int? activeTab;
//   final String caseID;
//   final CaseModel $extra;

//   @override
//   Widget build(BuildContext context, GoRouterState state) =>
//       CaseDetailsPage(caseModel: $extra, activeTab: activeTab);
// }
