import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misc_packages/misc_packages.dart';
import 'package:recase/recase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../support_data.dart';

part '../../../generated/support_data/features/anesthesia_blocks/anesthesia_blocks_page.g.dart';

@riverpod
List<String> anesthesiaBlocksList(AnesthesiaBlocksListRef ref) {
  return ref.watch(
    supportDataNotifierProvider.select(
      (value) => value.anesthesiaBlocks.toList(),
    ),
  );
}

class AnesthesiaBlocksPage extends ConsumerWidget {
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
                ref
                    .watch(supportDataNotifierProvider.notifier)
                    .upsertAnesthesiaBlock(value);
              });
            },
          ),
        ],
      ),
      body: const AnesthesiaBlocksView(),
    );
  }
}

class AnesthesiaBlocksView extends ConsumerWidget {
  const AnesthesiaBlocksView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blocks = ref.watch(anesthesiaBlocksListProvider);

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
            ref
                .watch(supportDataNotifierProvider.notifier)
                .upsertAnesthesiaBlock(block);
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
                ref
                    .watch(supportDataNotifierProvider.notifier)
                    .upsertAnesthesiaBlock(newItem)
                    .then((_) {
                  if (context.mounted) Navigator.of(context).pop();
                });
              },
            );
          },
        );
      },
    );
  }
}
