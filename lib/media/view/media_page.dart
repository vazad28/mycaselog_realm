import 'package:app_l10n/app_l10n.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/app_const.dart';
import '../media.dart';
import '../search/media_search_bar.dart';

class MediaPage extends ConsumerStatefulWidget {
  const MediaPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MediaPageState();
}

class _MediaPageState extends ConsumerState<MediaPage> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    Future<void>.delayed(Durations.short1)
        .then((_) => _scrollController.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('__medias_page_scaffold_key__'),
      backgroundColor: context.colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        surfaceTintColor: context.colorScheme.surfaceTint,
      ),
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          const MediaAppBar(),
          const MediaSearchBar(),
          CupertinoSliverRefreshControl(
            builder: customScrollViewRefreshIndicator,
            refreshTriggerPullDistance: AppConst.kRefreshTriggerPullDistance,
            onRefresh: () =>
                ref.watch(mediaNotifierProvider.notifier).pullToRefresh(),
          ),
          const _MediaBody(),
        ],
      ),
    );
  }
}

class _MediaBody extends ConsumerWidget {
  const _MediaBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stream = ref.watch(mediaNotifierProvider);

    return stream.when(
      data: (data) {
        if (data.results.isEmpty) {
          return SliverFillRemaining(
            child: Loading(
              text: S.of(context).noMedia,
            ),
          );
        }
        return MediaView(
          mediaModels: data.results,
        );
      },
      error: buildErrorSliver,
      loading: buildLoadingSliver,
    );
  }
}
