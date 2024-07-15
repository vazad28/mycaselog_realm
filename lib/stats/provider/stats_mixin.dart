import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../stats.dart';

mixin StatsMixin {
  void searchStats(WidgetRef ref, String? searchTerm, String? filterClause) {
    ref.watch(statsNotifierProvider.notifier).searchStats(
          searchTerm: searchTerm,
          filterClause: filterClause,
        );
  }
}
