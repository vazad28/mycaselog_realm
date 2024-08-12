import 'dart:io';

import 'package:flutter_archive/flutter_archive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:state_of/state_of.dart';

import '../../core/failures/app_failures.dart';
import '../../core/providers/providers.dart';

part '../../generated/database_io/export/database_export_provider.g.dart';

const _realmExportFile = 'database_export.zip';

final zipFilePathProvider = Provider.autoDispose<String>((ref) {
  final appDocDirectory = ref.watch(appDirPathProvider);

  final zipFilePath = '$appDocDirectory/$_realmExportFile';
  return zipFilePath;
});

@riverpod
class DatabaseExportNotifier extends _$DatabaseExportNotifier {
  @override
  StateOf<File?> build() {
    return const StateOf<File?>.init();
  }

  File? getIsarExportFile() {
    final zipFilePath = ref.watch(zipFilePathProvider);
    if (File(zipFilePath).existsSync()) return File(zipFilePath);
    return null;
  }

  Future<void> createIsarExportFile() async {
    try {
      //final appDocDirectory = ref.watch(appDirPathProvider);
      final zipFilePath = ref.watch(zipFilePathProvider);

      final realmDatabase = await ref.watch(realmDatabaseProvider.future);

      // Get the path to the documents directory
      final documentsDirPath = ref.watch(appDirPathProvider);

      // Create a temporary directory for the export
      final appDocDirectory = Directory(documentsDirPath);
      await appDocDirectory.create(recursive: true);

      // Copy the Realm file to the temporary directory
      final realmFile = File(realmDatabase.realm.config.path);
      final exportedRealmFile =
          File('${appDocDirectory.path}/database_export.realm');
      await realmFile.copy(exportedRealmFile.path);

      // Write the ZIP archive to a file
      final zipFile = File('${appDocDirectory.path}/$_realmExportFile');

      /// create zip fiel encoder
      await ZipFile.createFromFiles(
        sourceDir: appDocDirectory,
        files: [realmFile],
        zipFile: zipFile,
      );

      // You might want to handle the ZIP file here, e.g., share it, show a notification, etc.
      //print('Database exported to ${zipFile.path}');

      // Clean up the temporary directory
      //await tempDir.delete(recursive: true);
      state = StateOf<File?>.success(File(zipFilePath));
    } catch (err) {
      // Handle errors
      //print('Error exporting database: $err');
      state = StateOf<File?>.failure(err.toAppFailure());
    }
  }

  Future<void> shareExportedDatabaseFile() async {
    final filePath = ref.read(zipFilePathProvider);
    final dialogService = ref.watch(dialogServiceProvider);

    if (!File(filePath).existsSync()) {
      return dialogService.showSnackBar(
        const AppFailure.fileNotFound().toLocalizedString(),
      );
    }

    await dialogService
        .shareFile([filePath], 'Share Exported Database').then((result) {
      result.when(
        failure: (l) => dialogService.showInfoDialog(l.toLocalizedString()),
        success: (r) {
          if (r.status == ShareResultStatus.success) return;
          dialogService.showSnackBar(r.status.name);
        },
      );
    });
  }
}
