import 'package:app_models/app_models.dart';
import 'package:encryption_client/encryption_client.dart';
import 'package:logger_client/logger_client.dart';
import 'package:storage/storage.dart';

import '../../../app_data.dart';

part 'fts_search_repository.dart';

class FtsSearchRepositoryImpl extends FtsSearchRepository with LoggerMixin {
  FtsSearchRepositoryImpl({
    required DatabaseService databaseService,
    required PersistentStorage persistentStorage,
    required EncryptionRepository encryptionRepository,
  })  : _databaseService = databaseService,
        _persistentStorage = persistentStorage,
        _encryptionRepository = encryptionRepository;

  final DatabaseService _databaseService;
  final PersistentStorage _persistentStorage;
  final EncryptionRepository _encryptionRepository;

  @override
  Future<List<T>> searchCaseMedia<T>(
    String searchTerm,
  ) async {
    // list of case IDs matching the search term
    final caseModels = _databaseService.casesCollection.search(searchTerm);

    // if list of IDs is empty return empty
    if (caseModels.isEmpty) return [];

    /// return results if matching
    if (T == CaseModel) {
      return caseModels as List<T>;
    }

    final caseIDs = caseModels.map((e) => e.caseID).toList();

    if (T == MediaModel) {
      final mediaModels =
          _databaseService.mediaCollection.getMediaModelsForCaseIds(caseIDs);
      return mediaModels as List<T>;
    }

    if (T == HybridMediaModel) {
      /// create a lookup map of the caseModel by caseID
      final lookup = <String, CaseModel>{};

      for (final caseModel in caseModels) {
        lookup.putIfAbsent(caseModel.caseID, () => caseModel);
      }

      /// Hold list of hybrid models
      final hybridMedia = <HybridMediaModel>[];

      final mediaModels =
          _databaseService.mediaCollection.getMediaModelsForCaseIds(caseIDs);

      for (final mediaModel in mediaModels) {
        hybridMedia.add(
          HybridMediaModel(
            mediaModel: mediaModel,
            caseModel: lookup[mediaModel.caseID],
          ),
        );
      }

      return hybridMedia as List<T>;
    } else {
      throw Exception('Search model type not defined');
    }
  }

  @override
  Future<List<NoteModel>> searchNotes(String searchTerm) async {
    // list of case IDs matching the search term
    return _databaseService.notesCollection.search(searchTerm);
  }
}
