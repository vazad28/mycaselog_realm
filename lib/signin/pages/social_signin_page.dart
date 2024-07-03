part of '../view/signin_page.dart';

class SocialSigninPage extends ConsumerWidget {
  const SocialSigninPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginContent = ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: const Padding(
        padding: EdgeInsets.all(30),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SocialSignInTitle(text: 'Welcome to MyCaselog!'),
              Align(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8, top: 8),
                  child: Text(
                    'Please select sign in option to continue',
                  ),
                ),
              ),
              ...[SignInButtons()],
            ],
          ),
        ),
      ),
    );

    final body = ResponsivePage(
      desktopLayoutDirection: TextDirection.ltr,
      headerBuilder: (context, constraints, shrinkOffset) {
        return const AspectRatio(aspectRatio: 1, child: AppLogo())
            .paddingAll(AppSpacing.xlg);
      },
      headerMaxExtent: MediaQuery.of(context).size.height * 0.3,
      sideBuilder: (_, constraints) {
        return const AspectRatio(aspectRatio: 1, child: AppLogo())
            .paddingAll(AppSpacing.xlg);
      },
      child: loginContent,
    );

    return Scaffold(
      body: body,
      resizeToAvoidBottomInset: true,
    );
  }
}

/// Social login buttons
class SignInButtons extends StatelessWidget {
  const SignInButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xxlg),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GoogleSignInButton(),
          SizedBox(height: AppSpacing.lg),
          //FacebookSignInButton(),
          //SizedBox(height: AppSpacing.lg),
          SizedBox(height: AppSpacing.lg),
          LabeledDivider(
            label: 'OR',
            //color: theme.colorScheme.onPrimary,
          ),
          //const SizedBox(height: AppSpacing.lg),
          EmailSignInButton(),
          TermsAndPolicyText(
              //color: theme.colorScheme.onPrimary,
              ),
        ],
      ),
    );
  }
}

class SocialSignInTitle extends PlatformWidget {
  const SocialSignInTitle({required this.text, super.key});
  final String text;

  @override
  Widget buildCupertino(BuildContext context) {
    return Text(
      text,
      style: CupertinoTheme.of(context).textTheme.navLargeTitleTextStyle,
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineSmall,
      textAlign: TextAlign.center,
    );
  }
}
