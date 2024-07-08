import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: SettingsPage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        const SettingsAppBar(),
        const SettingsView(),
        SliverToBoxAdapter(
          child: SizedBox(height: MediaQuery.of(context).padding.bottom),
        ),
      ],
    );
  }
}
