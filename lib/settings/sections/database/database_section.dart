import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../csv_export/csv_export.dart';
import '../../../database_io/database_io.dart';
import '../../../router/router.dart';

part 'tiles/database_io_tile.dart';
part 'tiles/export_csv_data_tile.dart';
part 'tiles/reindex_fts_search_tile.dart';
part 'tiles/sync_data_tile.dart';

class SyncSettingsSection extends StatelessWidget {
  const SyncSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        VerticalSpacer.normal,
        SyncDataTile(),
        ReindexSearchTile(),
        DatabaseIoTile(),
        ExportCsvDataTile(),
      ],
    );
  }
}
