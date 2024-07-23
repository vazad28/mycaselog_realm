import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../add_case/add_case.dart';
import '../../case_details/case_details.dart';
import '../../cases/cases.dart';
import '../utils/route_animations.dart';

part '../../generated/router/routes/cases_routes.g.dart';

@TypedGoRoute<CasesRoute>(
  path: CasesRoute.path,
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<CaseDetailsRoute>(path: CaseDetailsRoute.path),
    TypedGoRoute<AddCaseRoute>(path: AddCaseRoute.path),
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

class AddCaseRoute extends GoRouteData {
  AddCaseRoute({this.caseID = 'new', this.tabIndex = 0});
  static const name = 'add_case';
  static const path = 'case/:caseID/:tabIndex';

  final String caseID;
  final int tabIndex;

  @override
  Widget build(BuildContext context, GoRouterState state) => AddCasePage(
        tabIndex: tabIndex,
        caseID: caseID,
      );
}

/// cases details route
class CaseDetailsRoute extends GoRouteData {
  CaseDetailsRoute(this.caseID, {this.activeTab});
  // : caseID = $extra.caseID;

  static const path = ':caseID/:activeTab';
  static const name = 'case_details';

  final int? activeTab;
  final String caseID;
  //final CaseModel $extra;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      CaseDetailsPage(caseID: caseID, activeTab: activeTab);
}
