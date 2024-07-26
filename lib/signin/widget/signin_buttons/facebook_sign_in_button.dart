import 'package:app_assets/app_assets.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/signin_provider.dart';
import '../../provider/signin_state.dart';

class FacebookSignInButton extends ConsumerWidget with SigninMixin {
  const FacebookSignInButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signInStatus = signInState(ref);

    return FilledButton(
      key: const Key('loginForm_facebookLogin_appButton'),
      style: FilledButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.all(AppSpacing.lg),
      ),
      onPressed: () => signInStatus.isLoading ? null : signinWithFacebook(ref),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.facebook.svg(),
          const SizedBox(width: AppSpacing.lg),
          Assets.images.continueWithFacebook.svg(),
        ],
      ),
    );
  }
}
