import 'package:app_models/app_models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

mixin CasesMixin {
  /// delete case media
  Future<void> deleteCase(
    WidgetRef ref,
    CaseModel model,
  ) {
    return ref
        .watch(dbProvider)
        .casesCollection
        .update(model.caseID, {'removed': 1});
  }
}
