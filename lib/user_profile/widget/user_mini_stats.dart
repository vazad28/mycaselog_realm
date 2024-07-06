// ignore_for_file: require_trailing_commas

import 'package:app_data/app_data.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:async_result/async_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/failures/app_failures.dart';
import '../../core/providers/providers.dart';

///
/// provider for user mini stats
///
final userMiniStatsProvider =
    FutureProvider.autoDispose<Result<UserStatsModel, Exception>>((ref) {
  return ref.watch(statsRepositoryProvider).getUserStats();
});

/// User Mini widget
class UserMiniStatsWidget extends ConsumerWidget {
  const UserMiniStatsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userMiniStatsData = ref.watch(userMiniStatsProvider);

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 68, maxWidth: 300),
      child: userMiniStatsData.maybeWhen(
        data: (statsResult) => statsResult.when(
          failure: (l) => Text(l.toLocalizedString()),
          success: (r) => statsTile(context, r),
        ),
        orElse: () => const Loading(),
      ),
    );
  }

  Widget _label(String text, TextStyle? style) {
    return Expanded(
      child: Text(text, style: style, textAlign: TextAlign.center),
    );
  }

  Widget _data(String text, TextStyle? style) {
    return Expanded(
      child: Text(text, style: style, textAlign: TextAlign.center),
    );
  }

  Widget statsTile(BuildContext context, UserStatsModel stats) {
    final textTheme = Theme.of(context).textTheme;
    final labelStyle = textTheme.bodyMedium;
    final dataStyle = textTheme.headlineSmall;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _label('Cases', labelStyle),
            _label('Media', labelStyle),
            _label('Notes', labelStyle)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _data(stats.cases.toString(), dataStyle),
            _data(stats.media.toString(), dataStyle),
            _data(stats.notes.toString(), dataStyle)
          ],
        )
      ],
    );
  }
}
