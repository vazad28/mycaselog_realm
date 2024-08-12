import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class SyncBottomSheet extends StatefulWidget {
  final void Function(int?) onSelect;

  // ignore: sort_constructors_first
  const SyncBottomSheet({required this.onSelect, super.key});

  @override
  _SyncBottomSheetState createState() => _SyncBottomSheetState();
}

class _SyncBottomSheetState extends State<SyncBottomSheet> {
  final List<Duration> durations = [
    //const Duration(hours: 24),
    const Duration(hours: 48),
    const Duration(days: 4),
    const Duration(days: 7),
    const Duration(days: 28),
    const Duration(days: 112),
  ];

  void _syncWithDuration(Duration duration) {
    final syncTimestamp = DateTime.now().subtract(duration);
    widget.onSelect(syncTimestamp.millisecondsSinceEpoch);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return DraggableBottomSheetBuilder(
      itemCount: durations.length + 1,
      title: ListTile(
        dense: true,
        title: Text(S.of(context).selectSyncTime.toUpperCase()),
      ),
      divider: const Divider(thickness: 0.5, indent: 16, height: 1),
      itemBuilder: (ctx, index) {
        if (index == durations.length) {
          return ListTile(
            title: const Text('All'),
            onTap: () {
              widget.onSelect(0);
              Navigator.pop(context);
            },
          );
        }
        final duration = durations[index];
        final durationInDays = duration.inDays;

        final title = durationInDays > 7
            ? '${(durationInDays / 7).round()} weeks'
            : '$durationInDays days';
        return ListTile(
          title: Text(title),
          onTap: () => _syncWithDuration(duration),
        );
      },
    );
  }
}
