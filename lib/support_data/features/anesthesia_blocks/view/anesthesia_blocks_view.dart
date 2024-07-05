import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misc_packages/misc_packages.dart';

import '../../../support_data.dart';

class AnesthesiaBlocksView extends ConsumerWidget
    with AnesthesiaBlocksStateMixin, AnesthesiaBlocksEventMixin {
  const AnesthesiaBlocksView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blocks = anesthesiaBlocks(ref);

    if (blocks.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'No Anesthesia Block',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(AppSpacing.sm),
      itemCount: blocks.length,
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        indent: AppSpacing.lg,
      ),
      itemBuilder: (_, index) {
        final block = blocks[index];
        return DismissibleListTile(
          title: block,
          onDismissed: () {
            removeAnesthesiaBlock(ref, block);
          },
          onTap: () {
            context
                .showInputDialog<String?>(
              title: 'Edit Block',
              value: block,
            )
                .then(
              (newItem) {
                if (newItem == null || newItem.isEmpty) return;

                final idx = blocks.indexOf(block);

                if (idx >= 0) {
                  blocks[idx] = newItem;
                  updateAnesthesiaBlocks(ref, blocks);
                }
              },
            );
          },
        );
      },
    );
  }
}
