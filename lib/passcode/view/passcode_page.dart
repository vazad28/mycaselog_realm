import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger_client/logger_client.dart';

import '../../auth_flow/provider/auth_flow_provider.dart';
import '../../splash/splash_page.dart';
import '../passcode.dart';

class PasscodePage extends ConsumerStatefulWidget {
  const PasscodePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PasscodePageState();
}

class _PasscodePageState extends ConsumerState<PasscodePage> with LoggerMixin {
  String _message = '';

  @override
  void initState() {
    Future<void>.delayed(const Duration(milliseconds: 1500)).then((_) {
      if (mounted) {
        setState(() => _message = 'setting up user..');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final passcodeState = ref.watch(passcodeNotifierProvider);

    return passcodeState.when(
      data: (_) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          ref.watch(authFlowNotifierProvider.notifier).onAuthorized();
        });
        return const SplashPage();
      },
      loading: () => SplashPage(message: _message),
      error: (e, st) {
        return _PasscodeErrorView(
          message: e.toString(),
          onRetry: () => ref.invalidate(passcodeNotifierProvider),
        );
      },
    );
  }
}

class _PasscodeErrorView extends StatelessWidget {
  const _PasscodeErrorView({
    required this.message,
    required this.onRetry,
    super.key,
  });
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(
              height: AppSpacing.lg,
            ),
            ElevatedButton(
              onPressed: onRetry,
              child: Text('Retry'.hardcoded),
            ),
          ],
        ),
      ),
    );
  }
}
