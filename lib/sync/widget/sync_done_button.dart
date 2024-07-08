import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//import '../../core/providers/sync_provider.dart';

class SyncDoneButton extends ConsumerWidget {
  const SyncDoneButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final state = ref.watch(activeSyncCollectionListProvider).length;
    return FabButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icons.close,
      roundedCorner: true,
    );

    // return state <= 0
    //     ? FabButton(
    //         onPressed: () {
    //           Navigator.of(context).pop();
    //         },
    //         icon: Icons.close,
    //         roundedCorner: true,
    //       )
    //     : const TextButton(
    //         onPressed: null,
    //         child: Text('sync in progress..'),
    //       );
  }
}
