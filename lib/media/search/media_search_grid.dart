// part of 'media_search_bar.dart';

// class MediaSearchView extends StatelessWidget {
//   const MediaSearchView({
//     required this.thumbWidgets,
//     required this.crossAxisCount,
//     super.key,
//   });

//   final Iterable<Widget> thumbWidgets;
//   final int crossAxisCount;

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       padding: const EdgeInsets.all(AppSpacing.xs),
//       itemCount: thumbWidgets.length,
//       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: crossAxisCount,
//         mainAxisSpacing: AppSpacing.xs,
//         crossAxisSpacing: AppSpacing.xs,
//       ),
//       itemBuilder: (_, index) {
//         return thumbWidgets.elementAt(index);
//       },
//     );
//   }
// }
