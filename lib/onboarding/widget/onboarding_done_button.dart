import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth_flow/auth_flow.dart';

class OnboardingDoneButton extends ConsumerWidget {
  const OnboardingDoneButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        ref.watch(authFlowNotifierProvider.notifier).onOnboardingCompleted();
      },
      child: Text(
        'Get Started'.toUpperCase(),
      ),
    );
  }
}
