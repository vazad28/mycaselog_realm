import 'package:app_models/app_models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../providers/collections_providers.dart';
import '../providers/providers.dart';

part '../../generated/core/services/fts_search_service.g.dart';

@riverpod
FtsSearchService ftsSearchService(FtsSearchServiceRef ref) {
  return FtsSearchService(ref);
}

class FtsSearchService {
  FtsSearchService(this.ref);

  final FtsSearchServiceRef ref;

  Future<List<T>> searchCaseMedia<T>(String searchTerm) async {
    // list of case IDs matching the search term
    final caseModels =
        ref.watch(collectionsProvider).casesCollection.searchCases(searchTerm);

    // if list of IDs is empty return empty
    if (caseModels.isEmpty) return [];

    /// return results if matching
    if (T == CaseModel) {
      return caseModels as List<T>;
    } else if (T == MediaModel) {
      throw Exception('Search model type not defined');
      //return caseModels.fold(<T>[], (prev, element) => element.medias);
      //return caseModels.map((e) => e.medias.isEmpty).toList() as List<T>;
    } else {
      throw Exception('Search model type not defined');
    }

    // final caseIDs = caseModels.map((e) => e.caseID).toList();

    // if (T == MediaModel) {
    //   final mediaModels = ref
    //       .watch(collectionsProvider)
    //       .mediaCollection
    //       .getMediaModelsForCaseIds(caseIDs);
    //   return mediaModels as List<T>;
    // }

    // if (T == HybridMediaModel) {
    //   /// create a lookup map of the caseModel by caseID
    //   final lookup = <String, CaseModel>{};

    //   for (final caseModel in caseModels) {
    //     lookup.putIfAbsent(caseModel.caseID, () => caseModel);
    //   }

    //   /// Hold list of hybrid models
    //   final hybridMedia = <HybridMediaModel>[];

    //   final mediaModels = ref
    //       .watch(collectionsProvider)
    //       .mediaCollection
    //       .getMediaModelsForCaseIds(caseIDs);

    //   for (final mediaModel in mediaModels) {
    //     hybridMedia.add(
    //       HybridMediaModel(
    //         mediaModel: mediaModel,
    //         caseModel: lookup[mediaModel.caseID],
    //       ),
    //     );
    //   }

    //   return hybridMedia as List<T>;
    // } else {
    //   throw Exception('Search model type not defined');
    // }
  }

  Future<List<NoteModel>> searchNotes(String searchTerm) async {
    // list of case IDs matching the search term
    return ref.watch(collectionsProvider).notesCollection.search(searchTerm);
  }

  // String _processSearchTerm(String? searchTerm) {
  //   String searchTermProcessed;

  //   final split = searchTerm?.split(RegExp(r'\s+')) ?? [];
  //   if (split.length > 1) {
  //     searchTermProcessed = split.map((term) => '$term*').join(' ');
  //   } else {
  //     searchTermProcessed = '$searchTerm*';
  //   }

  //   return searchTermProcessed;
  // }
}
