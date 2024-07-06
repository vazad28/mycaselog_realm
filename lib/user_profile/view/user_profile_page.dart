import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../user_profile.dart';

class UserProfilePage extends ConsumerWidget {
  const UserProfilePage({super.key});

  static Page<void> page() =>
      const MaterialPage<void>(child: UserProfilePage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const BackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: const [
          SignOutButton(),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return _pullRefresh(ref);
        },
        child: const TapOutsideUnfocus(
          child: UserProfileView(),
        ),
      ),
    );
  }

  Future<void> _pullRefresh(WidgetRef ref) async {
    ref
      ..invalidate(userProfileNotifierProvider)
      ..invalidate(userMiniStatsProvider);
  }
}
