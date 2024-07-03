import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings.dart';

class SettingsPage extends ConsumerWidget with SettingsEventMixin, SettingsStateMixin{
  const SettingsPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: SettingsPage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(settingsNotifierProvider.notifier);
    

    return  Scaffold(
      appBar: AppBar(title: const Text('SettingsScreen'),),
      body: const SettingsView(),
    );
  }
}