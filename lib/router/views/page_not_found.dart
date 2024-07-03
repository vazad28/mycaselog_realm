import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({this.error, super.key});
  final Exception? error;

  static Page<void> page([Exception? err]) => MaterialPage<void>(
        child: PageNotFoundScreen(error: err),
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          // Image.asset(
          //   'assets/images/404_error.png',
          //   fit: BoxFit.cover,
          //   height: MediaQuery.of(context).size.height,
          //   width: MediaQuery.of(context).size.width,
          // ),
          Positioned(
            bottom: 50,
            left: 24,
            right: 24,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                //const SizedBox(height: 30),
                Text(
                  '404',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.displayMedium,
                ),
                const SizedBox(height: 30),
                Text(
                  'Oops! The page you are looking for\nis not found',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(height: 50),
                OutlinedButton(
                  onPressed: () {
                    GoRouter.of(context).go('/cases');
                  },
                  child: const Text('Home'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
