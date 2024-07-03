import 'package:app_assets/app_assets.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/signin_provider.dart';

class EmailSignInButton extends ConsumerWidget
    with SigninEventMixin, SigninStateMixin {
  const EmailSignInButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final buttonColor = theme.colorScheme.onSurface.withAlpha(200);
    return TextButton(
      key: const Key('loginForm_emailLogin_appButton'),
      style: TextButton.styleFrom(
        foregroundColor: buttonColor,
        padding: const EdgeInsets.all(AppSpacing.lg),
      ),
      onPressed: () => Navigator.pushNamed(context, '/sign-in'),
      // Navigator.of(context).push(
      //     MaterialPageRoute<void>(builder: (_) => const EmailSigninPage())),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.emailOutline.svg(
            colorFilter: ColorFilter.mode(buttonColor, BlendMode.srcIn),
          ),
          const SizedBox(width: AppSpacing.lg),
          Text(S.of(context).loginWithEmailButtonText),
        ],
      ),
    );
  }
}
