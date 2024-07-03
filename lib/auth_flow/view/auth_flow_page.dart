import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../onboarding/onboarding.dart';
import '../../router/utils/route_animations.dart';
import '../../signin/signin.dart';
import '../../splash/splash_page.dart';
import '../../start_up/start_up.dart';
import '../auth_flow.dart';

class AuthFlowPage extends ConsumerWidget {
  const AuthFlowPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: AuthFlowPage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FlowBuilder<AuthFlowState>(
      state: ref.watch(authFlowNotifierProvider),
      onGeneratePages: onGenerateAppViewPages,
    );
  }

  List<Page<dynamic>> onGenerateAppViewPages(
    AuthFlowState authState,
    List<Page<dynamic>> pages,
  ) {
    //debugPrint('authState in authFlow $authState');
    return authState.when(
      unboarded: () => [
        SharedAxisTransitionPage(
          key: const ValueKey('__AuthFlowPage_OnboardingPage_route_key__'),
          child: const OnboardingPage(),
        ),
      ],
      authenticated: (_) => [
        SharedAxisTransitionPage(
          key: const ValueKey('__AuthFlowPage_PasscodePage_route_key__'),
          child: const StartUpPage(),
        ),
      ],
      unauthenticated: () => [
        SharedAxisTransitionPage(
          key: const ValueKey('__AuthFlowPage_SigninPage_route_key__'),
          child: const SigninPage(),
        ),
      ],
      authorized: (_) => [
        const NoTransitionPage(
          key: ValueKey('__AuthFlowPage_SplashPage_route_key__'),
          child: SplashPage(),
        ),
      ],
    );
  }
}
