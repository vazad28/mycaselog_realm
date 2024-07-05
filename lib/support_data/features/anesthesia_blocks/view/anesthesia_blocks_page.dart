import 'package:app_l10n/app_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misc_packages/misc_packages.dart';
import 'package:recase/recase.dart';

import '../../../support_data.dart';

class AnesthesiaBlocksPage extends ConsumerWidget
    with AnesthesiaBlocksEventMixin {
  const AnesthesiaBlocksPage({super.key});

  static Page<void> page() =>
      const MaterialPage<void>(child: AnesthesiaBlocksPage());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 1,
        title: Text(S.of(context).anesthesiaBlock.titleCase),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context
                  .showInputDialog<String?>(
                title: S.of(context).anesthesiaBlock.titleCase,
              )
                  .then((value) {
                if (value == null) return;
                addAnesthesiaBlock(ref, value);
              });
            },
          ),
        ],
      ),
      body: const AnesthesiaBlocksView(),
    );
  }
}
