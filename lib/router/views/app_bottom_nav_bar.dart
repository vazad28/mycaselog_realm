import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/bottom_bar_visibility_provider.dart';

class AppBottomNavBar extends ConsumerWidget {
  const AppBottomNavBar(this.navigationBar, {super.key});

  final Widget navigationBar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navBarVisible = ref.watch(bottomNavVisibilityProvider);

    return AnimatedContainer(
      duration: Durations.medium1,
      height:
          !navBarVisible ? 0 : (64 + MediaQuery.of(context).viewPadding.bottom),
      curve: Curves.easeIn,
      child: navigationBar,
    );
  }
}
