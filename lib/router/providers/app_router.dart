import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth_flow/auth_flow.dart';
import '../../core/app_vars.dart';
import '../routes/routes.dart';
import '../views/page_not_found.dart';
import 'routes_provider.dart';

part '../../generated/router/providers/app_router.g.dart';

/// A state provider holding the state for the visibility of the
/// bottom navigation bar
@Riverpod(keepAlive: true)
class MycaselogRouter extends _$MycaselogRouter {
  @override
  GoRouter build() {
    final router = GoRouter(
      navigatorKey: AppVars.appRootNavigatorKey,
      initialLocation: AuthFlowRoute.path,
      routes: ref.read(routesProvider),
      errorPageBuilder: (context, state) => const NoTransitionPage(
        child: PageNotFoundScreen(),
      ),
      redirect: _redirector,
    );

    return router;
  }

  FutureOr<String?> _redirector(BuildContext context, GoRouterState state) {
    // Here we need to read the context `context.read()` and
    //decide what to do with its new values. we don't want to
    // trigger any new rebuild through `context.watch`
    final authFlowState = ref.read(authFlowNotifierProvider);

    final isAuthorizing = state.matchedLocation == AuthFlowRoute.path;

    final isAuthorized = authFlowState.isAuthorized;

    // Go to /auth_flow if the user is not final authorized
    if (!isAuthorized && !isAuthorizing) {
      //print('!isAuthorized && !isAuthorizing');
      return AuthFlowRoute.path;
    }

    // Go to /cases in root tabs if the user is signed in and tries to go to /signin.
    else if (isAuthorized && isAuthorizing) {
      //print('isAuthorized && isAuthorizing');
      return CasesRoute.path;
    }
    // no redirect
    return null;
  }
}

// @Riverpod(keepAlive: true)
// GoRouter appRouter(AppRouterRef ref) {
//   return GoRouter(
//     navigatorKey: AppVars.appRootNavigatorKey,
//     debugLogDiagnostics: false,
//     refreshListenable: null,
//     initialLocation: AuthFlowRoute.path,
//     routes: ref.read(routesProvider),
//     errorPageBuilder: (context, state) => const NoTransitionPage(
//       child: PageNotFoundScreen(),
//     ),
//     redirect: (BuildContext context, GoRouterState state) {
//       // Here we need to read the context `context.read()` and
//       // decide what to do with its new values. we don't want to
//       // trigger any new rebuild through `watch`
//       final authFlowState = ref.read(authFlowNotifierProvider);

//       final isAuthorizing = state.matchedLocation == AuthFlowRoute.path;
//       print('isAuthorizing $isAuthorizing');
//       final isAuthenticated = authFlowState.isAuthenticated;
//       print('isAuthenticated $isAuthenticated');

//       // Go to /auth_flow if the user is not final authorized
//       if (!isAuthenticated && !isAuthorizing) {
//         return AuthFlowRoute.path;
//       }

//       // Go to /cases in root tabs if the user is signed in and tries to go to /signin.
//       else if (isAuthenticated && isAuthorizing) {
//         return CasesRoute.path;
//       }

//       // no redirect
//       return null;
//     },
//   );
// }
