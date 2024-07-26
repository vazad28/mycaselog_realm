import 'package:app_assets/app_assets.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/signin_provider.dart';
import '../../provider/signin_state.dart';

class GoogleSignInButton extends ConsumerWidget with SigninMixin {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final signInStatus = signInState(ref);

    return FilledButton(
      key: const Key('loginForm_googleLogin_appButton'),
      onPressed: () => signInStatus.isLoading ? null : signinWithGoogle(ref),
      style: FilledButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.all(AppSpacing.lg),
        side: BorderSide(color: theme.colorScheme.onSurface),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (signInStatus.isLoading)
            const Spinner(color: Colors.black)
          else
            Assets.icons.google.svg(),
          const SizedBox(width: AppSpacing.lg),
          Assets.images.continueWithGoogle.svg(),
        ],
      ),
    );
  }
}
