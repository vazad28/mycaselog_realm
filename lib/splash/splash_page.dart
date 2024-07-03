import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({this.message, super.key});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Center(
            child: AppLogo(),
          ),
          if (message != null)
            Positioned(
              bottom: AppSpacing.xlg,
              left: 0,
              right: 0,
              child: Text(
                message!,
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }
}
