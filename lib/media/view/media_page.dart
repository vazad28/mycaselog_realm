import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/providers/providers.dart';
import '../../media_gallery/media_gallery.dart';
import '../media.dart';

class MediaPage extends ConsumerStatefulWidget {
  const MediaPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MediaPageState();
}

class _MediaPageState extends ConsumerState<MediaPage> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    Future<void>.delayed(Durations.long1)
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
        slivers: const [
          MediaAppBar(),
          _MediaBody(),
        ],
      ),
    );
  }
}

class _MediaBody extends ConsumerWidget {
  const _MediaBody({
    //required this.results,
    super.key,
  });

  //final RealmResults<MediaModel> results;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final results = ref.watch(collectionsProvider).mediaCollection.getAll();

    return SliverList.builder(
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        Thumbnail(
          mediaModel: results[index],
        );
      },
    );
    //   results: repository.messages(channel),
    //   itemBuilder: (context, item, animation) {
    //     return MessageTile(message: item, animation: animation);
    //   },
    //   reverse: true,
    //   controller: scrollController,
    // )
  }
}

// class _MediaBody extends ConsumerWidget {
//   const _MediaBody({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final data = ref.watch(mediaNotifierProvider);

//     return StreamBuilder<RealmResultsChanges<CaseModel>>(
//       stream: data.changes,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           final models = snapshot.data!.results;
//           // Rebuild your widget based on casesList
//           return CustomScrollView(
//             physics: const BouncingScrollPhysics(
//               parent: AlwaysScrollableScrollPhysics(),
//             ),
//             slivers: [
//               const MediaAppBar(),
//               //const CasesSearchBar(),
//               //MediaView(Models: models),
//             ],
//           );
//         } else if (snapshot.hasError) {
//           // Handle errors
//           return Text('Error: ${snapshot.error}');
//         } else {
//           // Handle loading state
//           return const CircularProgressIndicator();
//         }
//       },
//     );
//   }
// }
