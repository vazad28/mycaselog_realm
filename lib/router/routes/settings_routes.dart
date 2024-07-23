import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../settings/settings.dart';
import '../../support_data/support_data.dart';
import '../../templates/index.dart';
import '../../user_profile/user_profile.dart';
import '../utils/route_animations.dart';

part '../../generated/router/routes/settings_routes.g.dart';

@TypedGoRoute<SettingsRoute>(
  path: SettingsRoute.path,
  routes: <TypedGoRoute<GoRouteData>>[
    /// User Profile route
    TypedGoRoute<UserProfileRoute>(path: UserProfileRoute.path),

    /// active basic field
    TypedGoRoute<ActivableFieldsRoute>(path: ActivableFieldsRoute.path),

    /// Support Data Routes
    TypedGoRoute<AnesthesiaBlocksSettingsRoute>(
      path: AnesthesiaBlocksSettingsRoute.path,
    ),
    TypedGoRoute<AssistantsRoute>(
      path: AssistantsRoute.path,
      routes: [
        TypedGoRoute<AddAssistantRoute>(path: AddAssistantRoute.path),
      ],
    ),
    TypedGoRoute<SurgeryLocationsRoute>(
      path: SurgeryLocationsRoute.path,
      routes: [
        TypedGoRoute<AddSurgeryLocationRoute>(
          path: AddSurgeryLocationRoute.path,
        ),
      ],
    ),

    /// Templates routes
    TypedGoRoute<TemplatesRoute>(
      path: TemplatesRoute.path,
      name: TemplatesRoute.name,
      routes: [
        TypedGoRoute<AddTemplateRoute>(
          path: AddTemplateRoute.path,
        ),
        TypedGoRoute<SharedTemplatesRoute>(
          path: SharedTemplatesRoute.path,
          routes: [
            // TypedGoRoute<SharedTemplateRoute>(
            //   path: SharedTemplateRoute.path,
            // ),
          ],
        ),
      ],
    ),
  ],
)

/// Root media tab cases
class SettingsRoute extends GoRouteData {
  const SettingsRoute();
  static const name = 'settings';
  static const path = '/$name';

  @override
  Page buildPage(BuildContext context, GoRouterState state) =>
      FadeTransitionPage(
        key: state.pageKey,
        child: const SettingsPage(),
      );
}

/// User profile
class UserProfileRoute extends GoRouteData {
  const UserProfileRoute();
  static const name = 'user_profile';
  static const path = name;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const UserProfilePage();
}

/// ////////////////////////////////////////////////////////////////////
/// Support Data Routes
/// ////////////////////////////////////////////////////////////////////

/// Active fields route
class ActivableFieldsRoute extends GoRouteData {
  const ActivableFieldsRoute();
  static const name = 'active_fields';
  static const path = name;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ActivableFieldsPage();
}

class AnesthesiaBlocksSettingsRoute extends GoRouteData {
  const AnesthesiaBlocksSettingsRoute();

  static const name = 'anesthesia_blocks';
  static const path = name;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AnesthesiaBlocksPage();
}

class AssistantsRoute extends GoRouteData {
  const AssistantsRoute();
  static const name = 'assistants';
  static const path = name;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AssistantsPage();
}

class AddAssistantRoute extends GoRouteData {
  AddAssistantRoute({this.assistantID = 'new'});
  static const name = 'add_assistant';
  static const path = ':assistantID';
  final String assistantID;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      AddAssistantPage(assistantID: assistantID);
}

class SurgeryLocationsRoute extends GoRouteData {
  const SurgeryLocationsRoute();
  static const name = 'surgery_locations';
  static const path = name;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SurgeryLocationsPage();
}

class AddSurgeryLocationRoute extends GoRouteData {
  AddSurgeryLocationRoute({this.locationID = 'new'});

  static const name = 'add_surgery_location';
  static const path = ':locationID';

  final String locationID;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      AddSurgeryLocationPage(
        locationID: locationID,
      );
}

// /// ////////////////////////////////////////////////////////////////////
// /// TEMPLATE ROUTES
// /// ////////////////////////////////////////////////////////////////////
/// all templates route
class TemplatesRoute extends GoRouteData {
  const TemplatesRoute();
  static const name = 'templates';
  static const path = name;

  @override
  TemplatesPage build(BuildContext context, GoRouterState state) =>
      const TemplatesPage();
}

// /// Add template route
class AddTemplateRoute extends GoRouteData {
  AddTemplateRoute(this.templateID);
  static const name = 'add_template';
  static const path = 'add_template/:templateID';
  static const newItemParam = 'new';

  final String templateID;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      AddTemplatePage(templateID: templateID);
}

/// Speciality Templates Route
class SharedTemplatesRoute extends GoRouteData {
  const SharedTemplatesRoute(this.speciality);
  static const name = 'shared_templates/:speciality';
  static const path = name;

  final String speciality;

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      SharedTemplatesPage(speciality: speciality);
}

/// Speciality shared template route
// class SharedTemplateRoute extends GoRouteData {
//   SharedTemplateRoute({required this.speciality, this.templateID = 'new'});

//   static const name = 'shared_template/:templateID';
//   static const path = name;

//   final String templateID;
//   final String speciality;

//   @override
//   Widget build(BuildContext context, GoRouterState state) =>
//       SharedTemplatePage(templateID: templateID, speciality: speciality);
// }
