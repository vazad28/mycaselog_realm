part of '../view/signin_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({
    required this.providers,
    super.key,
  });

  final List<EmailAuthProvider> providers;

  @override
  Widget build(BuildContext context) {
    return ForgotPasswordScreen(
      subtitleBuilder: (context) {
        return const EmailSigninSubTitleWidget(
            text:
                'Provide your email and we will send you a link to reset your password',);
      },
    );
  }
}
