import 'package:app_assets/app_assets.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/signin_provider.dart';
import '../../provider/signin_state.dart';

class AppleSignInButton extends ConsumerWidget
    with SigninEventMixin, SigninStateMixin {
  const AppleSignInButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInStatus = signInState(ref);

    return FilledButton(
      key: const Key('loginForm_appleLogin_appButton'),
      style: FilledButton.styleFrom(
        backgroundColor: Colors.black,
        padding: const EdgeInsets.all(AppSpacing.lg),
      ),
      onPressed: () => signInStatus.isLoading ? null : signinWithApple(ref),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.apple.svg(),
          const SizedBox(width: AppSpacing.lg),
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xs),
            child: Assets.images.continueWithApple.svg(),
          ),
        ],
      ),
    );
  }
}
