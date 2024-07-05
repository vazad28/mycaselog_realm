import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_client/logger_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/services/dialog_service.dart';
import '../../../support_data.dart';

part '../../../../generated/support_data/features/anesthesia_blocks/provider/anesthesia_blocks_provider.freezed.dart';
part '../../../../generated/support_data/features/anesthesia_blocks/provider/anesthesia_blocks_provider.g.dart';

@Freezed(
  copyWith: false,
  equal: false,
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions(maybeMap: false, mapOrNull: false),
)
class AnesthesiaBlocksEvent with _$AnesthesiaBlocksEvent {
  const factory AnesthesiaBlocksEvent.addAnesthesiaBlock(String block) =
      _AddAnesthesiaBlock;
  const factory AnesthesiaBlocksEvent.removeAnesthesiaBlock(String block) =
      _RemoveAnesthesiaBlock;
  const factory AnesthesiaBlocksEvent.updateAnesthesiaBlocks(
    List<String> blocks,
  ) = _UpdateAnesthesiaBlocks;
}

mixin AnesthesiaBlocksEventMixin {
  void addAnesthesiaBlock(WidgetRef ref, String block) {
    ref
        .watch(anesthesiaBlocksNotifierProvider.notifier)
        .on(AnesthesiaBlocksEvent.addAnesthesiaBlock(block));
  }

  void removeAnesthesiaBlock(WidgetRef ref, String block) {
    ref
        .watch(anesthesiaBlocksNotifierProvider.notifier)
        .on(AnesthesiaBlocksEvent.removeAnesthesiaBlock(block));
  }

  void updateAnesthesiaBlocks(WidgetRef ref, List<String> blocks) {
    ref
        .watch(anesthesiaBlocksNotifierProvider.notifier)
        .on(AnesthesiaBlocksEvent.updateAnesthesiaBlocks(blocks));
  }
}

mixin AnesthesiaBlocksStateMixin {
  List<String> anesthesiaBlocks(WidgetRef ref) =>
      ref.watch(anesthesiaBlocksNotifierProvider);
}

@riverpod
class AnesthesiaBlocksNotifier extends _$AnesthesiaBlocksNotifier
    with LoggerMixin {
  @override
  List<String> build() {
    return ref.watch(
      supportDataNotifierProvider
          .select((value) => value.anesthesiaBlocks ?? <String>[]),
    );
  }

  /// Update Support Data provider
  void _updateSupportData(List<String> blocks) {
    try {
      state = blocks;
      ref.watch(supportDataNotifierProvider.notifier).on(
            SupportDataEvent.updateAnesthesiaBlocks(blocks),
          );
    } catch (err) {
      ref.read(dialogServiceProvider).showSnackBar(err.toString());
    }
  }

  /// Map events to state
  void on(AnesthesiaBlocksEvent event) {
    event.map(
      addAnesthesiaBlock: (value) {
        final blocks = List<String>.from(state)..add(value.block);
        _updateSupportData(blocks);
      },
      updateAnesthesiaBlocks: (value) {
        _updateSupportData(value.blocks);
      },
      removeAnesthesiaBlock: (value) {
        final blocks = List<String>.from(state)..remove(value.block);
        _updateSupportData(blocks);
      },
    );
  }
}
