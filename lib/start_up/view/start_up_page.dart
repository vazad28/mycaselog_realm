import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger_client/logger_client.dart';

import '../../auth_flow/provider/auth_flow_provider.dart';
import '../../splash/splash_page.dart';
import '../start_up.dart';

part 'start_up_error_view.dart';

class StartUpPage extends ConsumerStatefulWidget {
  const StartUpPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StartUpPageState();

  static Page<void> page() => const MaterialPage<void>(child: StartUpPage());
}

class _StartUpPageState extends ConsumerState<StartUpPage> with LoggerMixin {
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
    final appStartUpState = ref.watch(startUpProvider);

    return appStartUpState.when(
        data: (_) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            ref.watch(authFlowNotifierProvider.notifier).onAuthorized();
          });
          return const SplashPage();
        },
        loading: () => SplashPage(message: _message),
        error: (e, st) {
          // final user = ref.read(authenticationUserProvider);
          // final path = 'users/${user.id}/data';
          // print(path);
          // FirebaseFirestore.instance
          //     .collection(path)
          //     .doc(user.id)
          //     .set({'speciality': 'orthopaedicSurgery'})
          //     .then((_) => logger.info('success'))
          //     .catchError((dynamic err) {
          //       logger.severe(err);
          //     });
          return AppStartUpErrorView(
            message: e.toString(),
            onRetry: () => ref.invalidate(startUpProvider),
          );
        },);
  }
}
