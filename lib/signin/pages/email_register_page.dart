part of '../view/signin_page.dart';

class EmailRegisterPage extends StatelessWidget {
  const EmailRegisterPage({
    required this.providers,
    super.key,
  });

  final List<EmailAuthProvider> providers;

  @override
  Widget build(BuildContext context) {
    return RegisterScreen(
      providers: providers,
      subtitleBuilder: (context, action) {
        return const EmailSigninSubTitleWidget(
            text: 'Please create an account to continue',);
      },
      actions: [
        AuthStateChangeAction<SignedIn>((context, state) {
          if (!state.user!.emailVerified) {
            state.user!.sendEmailVerification();
            //Navigator.pushNamed(context, SigninRoutes.verifyEmail);
          }
          //  else {
          //   Navigator.pushReplacementNamed(context, '/profile');
          // }
        }),
      ],
    );
  }
}
