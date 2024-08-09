import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:misc_packages/misc_packages.dart';

typedef OnSyncFromSelect = void Function(int? timestamp);

class SyncTimeSelector extends StatelessWidget {
  const SyncTimeSelector({required this.onSelect, super.key});

  static final currTimestamp = DateTime.now().millisecondsSinceEpoch;

  final OnSyncFromSelect onSelect;

  static const _secInDay = Duration.millisecondsPerDay;

  Map<String, int> getSyncItems() => {
        //'Last sync': lastSyncTimestamp,
        'Last 24 hours': currTimestamp - _secInDay,
        'Last 2 days': currTimestamp - (_secInDay * 2),
        'last 2 weeks': currTimestamp - (_secInDay * 14),
        'last 4 weeks': currTimestamp - (_secInDay * 30),
        'last 16 weeks': currTimestamp - (_secInDay * 112),
        'all data': 0,
      };

  @override
  Widget build(BuildContext context) {
    final syncTimeOptions = getSyncItems().entries.toList();

    return DraggableBottomSheetBuilder(
      itemCount: syncTimeOptions.length,
      itemBuilder: (ctx, index) {
        final syncTimeOption = syncTimeOptions[index];

        return ListTile(
          title: Text(syncTimeOption.key),
          onTap: () {
            if (syncTimeOption.value == 0) {
              context
                  .showConfirmDialog(S.of(context).syncAllDataWarning)
                  .then((res) {
                if (res == true) {
                  if (context.mounted) {
                    Navigator.of(context).pop(); //<- close modal sheet
                  }
                  onSelect(0);
                }
              });
            } else {
              Navigator.of(context).pop(); //<- close modal sheet
              Future<void>.delayed(const Duration(milliseconds: 300))
                  .then((value) => onSelect(syncTimeOption.value));
            }
          },
        );
      },
      title: ListTile(
        dense: true,
        title: Text(S.of(context).selectSyncTime),
        trailing: TextButton(
          child: Text(S.of(context).close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      divider: const Divider(
        height: 1,
        indent: 24,
      ),
    );
  }
}
