import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:state_of/state_of.dart';

import '../../core/core.dart';

part '../../generated/database_io/import/database_import_provider.g.dart';

@riverpod
class DatabaseImportNotifier extends _$DatabaseImportNotifier {
  late final String zipFilePath;

  @override
  StateOf<void> build() {
    return const StateOf<void>.init();
  }

  Future<void> deleteIsarExportFile() async {
    if (File(zipFilePath).existsSync()) File(zipFilePath).deleteSync();
  }

  Future<void> importIsarFile() async {
    try {
      final result = await FilePicker.platform
          .pickFiles(type: FileType.custom, allowedExtensions: ['zip']);

      if (result?.files.single.path == null) {
        state = const StateOf<void>.failure(
          AppFailure.generic('Database file to import not found'),
        );
      }

      /// read current databse file
      final dbFile =
          File(ref.watch(realmDatabaseProvider).requireValue.realm.config.path);

      /// if we have the db file warn user that this will be overwritten
      if (dbFile.existsSync()) {
        final res = await ref.watch(dialogServiceProvider).showConfirmDialog(
              'This action will over-write existing databse and is irreversible action. \nProceed?',
            );
        if (!res) return;
      }

      final file = await convertPlatformFileToFile(result!.files.single);

      await dbFile.writeAsBytes(file!.readAsBytesSync());

      state = const StateOf<void>.success(null);
    } catch (e) {
      state = const StateOf<void>.failure(
        AppFailure.generic('Database file import failed'),
      );
    }
  }

  // Future<void> importIsarFile() async {
  //   final appDocumentDirectoryPath = ref.read(appDirPathProvider);
  //   final dialogService = ref.read(dialogServiceProvider);

  //   try {
  //     final result = await FilePicker.platform
  //         .pickFiles(type: FileType.custom, allowedExtensions: ['zip']);

  //     if (result?.files.single.path == null) {
  //       state = const StateOf<void>.failure(
  //         AppFailure.generic('Database file to import not found'),
  //       );
  //       // return dialogService.showSnackBar(
  //       //   const AppFailure.fileNotFound().toLocalizedString(),
  //       // );
  //     }

  //     /// read and load the imported file
  //     final importedFile = File(result!.files.first.path!);

  //     /// path for the file to be loaded at. Same as defined in the main file for the
  //     /// start of the database. This is because we are replacing out database
  //     final isarDatabase = ref.watch(isarDatabaseProvider).requireValue;
  //     final appDbFilePath =
  //         '$appDocumentDirectoryPath/${isarDatabase.name}.isar';

  //     if (!File(appDbFilePath).existsSync()) {
  //       state = const StateOf<void>.failure(
  //         AppFailure.generic('Database file not found'),
  //       );
  //       return;
  //     }

  //     final res = await dialogService.showConfirmDialog(
  //       'This action will over-write existing databse and is irreversible action. \nProceed?',
  //     );

  //     if (!res) return;

  //     final dbFile =
  //         File('$appDocumentDirectoryPath/${isarDatabase.name}.isar');
  //     await dbFile.writeAsBytes(importedFile.readAsBytesSync());

  //     state = const StateOf<void>.success(null);
  //   } catch (err) {
  //     state = const StateOf<void>.failure(
  //       AppFailure.generic('Database file import failed'),
  //     );
  //   }
  // }
}

Future<File?> convertPlatformFileToFile(PlatformFile? platformFile) async {
  if (platformFile == null) return null;

  // Ensure the platformFile has a valid path
  if (platformFile.path == null) {
    return null;
  }

  final file = File(platformFile.path!);

  // Check if the file exists
  if (!file.existsSync()) {
    return null;
  }

  return file;
}
