part of '../view/signin_page.dart';

class EmailSigninPage extends StatelessWidget {
  const EmailSigninPage({
    required this.providers,
    super.key,
  });

  final List<EmailAuthProvider> providers;

  @override
  Widget build(BuildContext context) {
    return SignInScreen(
      providers: providers,
      subtitleBuilder: (context, action) {
        return const EmailSigninSubTitleWidget(
          text: 'Please sign in to continue',
        );
      },
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          if (state.user!.emailVerified) {
            Navigator.pushReplacementNamed(context, SigninRoutes.verifyEmail);
          }
        }),
        ForgotPasswordAction((context, state) {
          Navigator.pushNamed(context, SigninRoutes.forgotPassword);
        }),
      ],
      footerBuilder: (_, __) {
        return Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xlg),
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(S.of(context).goBack),
            ),);
      },
    );
  }
}
