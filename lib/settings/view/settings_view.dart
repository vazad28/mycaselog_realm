import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings.dart';

class SettingsView extends ConsumerWidget with SettingsEventMixin, SettingsStateMixin{
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsAsync = ref.watch(settingsNotifierProvider);

    return const Center(child: Text('SettingsView'));
  }
}