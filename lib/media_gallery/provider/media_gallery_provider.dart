import 'package:app_models/app_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/core.dart';

part '../../generated/media_gallery/provider/media_gallery_provider.g.dart';

/// ////////////////////////////////////////////////////////////////////
/// Provider to hold the caseID of the current media in the view
/// Its state is updated by the PageController of the gallery
/// This provider is watched by the another to load case details
/// ////////////////////////////////////////////////////////////////////
final currCaseIDProvider = StateProvider.autoDispose<String?>((ref) => null);

final currMediaModelProvider =
    StateProvider.autoDispose<MediaModel?>((ref) => null);

/// ////////////////////////////////////////////////////////////////////
/// Provider to watch current caseID and load the case data
/// Provider is watched by the header to update UI with case details
/// ////////////////////////////////////////////////////////////////////
@riverpod
FutureOr<CaseModel?> currCaseModel(CurrCaseModelRef ref) {
  final caseID = ref.watch(currCaseIDProvider);
  if (caseID == null) return null;
  return ref.watch(dbProvider).casesCollection.getSingle(caseID);
}
