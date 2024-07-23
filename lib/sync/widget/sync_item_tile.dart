import 'package:app_annotations/app_annotations.dart';
import 'package:app_extensions/app_extensions.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misc_packages/misc_packages.dart';
import 'package:recase/recase.dart';

import '../../core/failures/app_failures.dart';
import '../provider/sync_providers.dart';
import 'sync_time_selector.dart';

class SyncItemTile<T> extends ConsumerWidget {
  const SyncItemTile(this.dbCollection, {super.key});

  final DbCollection dbCollection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;

    return ListTile(
      title: Text(
        dbCollection.name.titleCase,
        style: textTheme.titleMedium,
      ),
      trailing: SizedBox(
        width: 80,
        child: _SyncItemTileTrailing<T>(
          dbCollection: dbCollection,
          onTap: () {
            context.openDraggableBottomSheet<T>(
              builder: (_) {
                /// Bottom sheet to select 'time since' for syncing data
                return SyncTimeSelector(
                  onSelect: (timestamp) async {
                    if (timestamp == null) return;

                    ref
                        .watch(collectionSyncerProvider(dbCollection).notifier)
                        .syncCollection(timestamp);
                  },
                );
              },
            );
          },
        ),
      ),
      subtitle: _SyncItemTileSubtitle(dbCollection: dbCollection),
    );
  }
}

///
/// Sync tite trailing
///
class _SyncItemTileTrailing<T> extends ConsumerWidget {
  const _SyncItemTileTrailing({
    required this.dbCollection,
    required this.onTap,
  });

  final DbCollection dbCollection;
  final void Function() onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(collectionSyncerProvider(dbCollection));

    return state.when(
      init: () => TextButton(
        onPressed: onTap.call,
        child: Text(S.of(context).sync),
      ),
      failure: (failure) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.showInfoDialog(failure.toLocalizedString());
        });
        return TextButton(
          onPressed: null,
          child: Text(
            'error',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.apply(color: context.colorScheme.error),
          ),
        );
      },
      cancelled: () => TextButton(
        onPressed: onTap.call,
        child: Text(S.of(context).cancelled),
      ),
      loading: (_) => const TextButton(onPressed: null, child: Spinner()),
      success: (data) => TextButton(
        onPressed: onTap.call,
        child: Text(data.toString()),
      ),
      initialized: (_) => const SizedBox.shrink(),
    );

    // return TextButton(
    //   onPressed: onTap.call,
    //   child: Text(S.of(context).sync),
    // );
  }

  // Future<void> _openSyncTimeOptions(
  //     BuildContext context, DbCollection dbCollection) {
  //   return context.openDraggableBottomSheet<T>(
  //     builder: (_) {
  //       /// Bottom sheet to select 'time since' for syncing data
  //       return SyncTimeSelector(onSelect: (timestamp) {
  //         if (timestamp == null) return;
  //         context.read<SyncCubit<T>>().syncData2(timestamp);
  //       });
  //     },
  //   );
  // }
}

///
/// Sync tile subtitle
///
class _SyncItemTileSubtitle extends ConsumerWidget {
  const _SyncItemTileSubtitle({
    required this.dbCollection,
  });

  final DbCollection dbCollection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final textTheme = Theme.of(context).textTheme;
    return const Text('subtitle');

    // final lastSyncTimestamp = ref
    //     .watch(syncRepositoryProvider)
    //     .getLastSyncTimeCollection(dbCollection.name);

    // return lastSyncTimestamp > 0
    //     ? Text(
    //         DateTime.fromMillisecondsSinceEpoch(lastSyncTimestamp).formatHMS(),
    //         style: textTheme.bodySmall,
    //       )
    //     : Text(
    //         S.of(context).never,
    //         style: textTheme.bodySmall,
    //       );
  }
}
