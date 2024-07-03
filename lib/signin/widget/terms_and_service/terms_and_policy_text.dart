import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'terms_and_policy_page.dart';

class TermsAndPolicyText extends StatelessWidget {
  const TermsAndPolicyText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.sm),
      child: RichText(
        key: const Key('loginWithEmailForm_terms_and_privacy_policy'),
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: S.of(context).loginWithEmailSubtitleText,
              style: theme.textTheme.bodySmall?.apply(
                color: theme.colorScheme.onSurface.withOpacity(0.6),
              ),
            ),
            TextSpan(
              text: S.of(context).loginWithEmailTermsAndPrivacyPolicyText,
              style: theme.textTheme.bodySmall?.apply(
                color: theme.colorScheme.onSurface.withOpacity(0.8),
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () => _showSheet(context),
              // showModalBottomSheet<void>(
              //       context: context,
              //       builder: (context) => Container(
              //           padding: const EdgeInsets.only(top: 16),
              //           color: Colors.transparent,
              //           child: DraggableScrollableSheet(
              //             // initialChildSize: 0.5,
              //             // minChildSize: 0.25,
              //             expand: false,
              //             builder: (_, controller) {
              //               return Material(
              //                 clipBehavior: Clip.antiAlias,
              //                 color: Theme.of(context).colorScheme.surface,
              //                 shape: const RoundedRectangleBorder(
              //                   borderRadius: BorderRadius.only(
              //                     topLeft: Radius.circular(AppSpacing.md),
              //                     topRight: Radius.circular(AppSpacing.md),
              //                   ),
              //                 ),
              //                 child: TermsAndPolicyPage(),
              //               );
              //             },
              //           )),
              //     ),
            ),
            TextSpan(
              text: '.',
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }

  void _showSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true, // set this to true
      builder: (_) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (_, controller) {
            return Container(
              color: Colors.blue[500],
              child: Material(
                clipBehavior: Clip.antiAlias,
                color: Theme.of(context).colorScheme.surface,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSpacing.md),
                    topRight: Radius.circular(AppSpacing.md),
                  ),
                ),
                child: TermsAndPolicyPage(controller: controller),
              ),
            );
          },
        );
      },
    );
  }
}
