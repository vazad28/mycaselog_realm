import 'package:flutter/material.dart';

import '../stats.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  static Page<void> page() => const MaterialPage<void>(child: StatsPage());

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar:
          orientation == Orientation.portrait ? const StatsSearchBar() : null,
      body: StatsView(orientation),
    );
  }
}
