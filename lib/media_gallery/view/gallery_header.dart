part of 'media_gallery_page.dart';

class MediaGalleryHeader extends ConsumerWidget implements PreferredSizeWidget {
  const MediaGalleryHeader({
    required this.navigateOnTap,
    super.key,
    this.onPush,
  });

  final void Function(CaseModel)? onPush;
  final bool navigateOnTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caseProvider = ref.watch(currCaseModelProvider);

    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black38,
              Colors.transparent,
            ],
          ),
        ),
        child: AppBar(
          toolbarHeight: kToolbarHeight +
              MediaQuery.of(AppVars.rootContext).viewPadding.top,
          backgroundColor: Colors.transparent,
          title: caseProvider.maybeWhen(
            data: (caseModel) => caseModel == null
                ? Loading(child: Text(S.of(context).dataIsNull))
                : ListTile(
                    onTap: () => onPush?.call(caseModel),
                    title: Text(
                      caseModel.surgery?.titleCase ?? 'No Surgery',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      caseModel.diagnosis?.sentenceCase ?? 'No Diagnosis',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: _CaseDataAvatar(caseModel),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  ),
            loading: () => const SizedBox.shrink(),
            orElse: () => Text(S.current.noData),
          ),
        ));
  }

  @override
  Size get preferredSize => Size.fromHeight(
        kToolbarHeight + MediaQuery.of(AppVars.rootContext).viewPadding.top,
      );
}

/// ////////////////////////////////////////////////////////////////////
/// Media gallery top bar case data tile
/// ////////////////////////////////////////////////////////////////////
// class _MediaGalleryHeaderTile extends ConsumerWidget {
//   const _MediaGalleryHeaderTile({
//     required this.navigateOnTap,
//     required this.onTap,
//   });

//   final void Function(CaseModel)? onTap;
//   final bool navigateOnTap;

//   Widget _tile(CaseModel caseModel) => Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Expanded(child: _CaseDataTile(caseModel)),
//           _CaseDataAvatar(caseModel),
//         ],
//       );

//   Widget _mainContent(
//     WidgetRef ref,
//     BuildContext context,
//     CaseModel caseModel,
//     double headerCaseTileHeight,
//   ) {
//     return InkWell(
//       onTap: () => onTap?.call(caseModel),
//       child: SizedBox(height: headerCaseTileHeight, child: _tile(caseModel)),
//     );
//   }

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final headerCaseTileHeight =
//         kToolbarHeight + MediaQuery.of(context).viewPadding.top;

//     /// watch for current media file selected
//     final caseProvider = ref.watch(currCaseModelProvider);

//     /// render header based on media file caseModel
//     return caseProvider.maybeWhen(
//       data: (data) => data == null
//           ? Loading(child: Text(S.of(context).dataIsNull))
//           : _mainContent(ref, context, data, headerCaseTileHeight),
//       loading: () => const SizedBox.shrink(),
//       orElse: () => Container(
//         color: context.colorScheme.errorContainer,
//         height: headerCaseTileHeight,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [Text(S.current.noData)],
//         ),
//       ),
//     );
//   }
// }

/// Widget for the case data in header tile
// class _CaseDataTile extends StatelessWidget {
//   const _CaseDataTile(
//     this.caseModel,
//   );

//   final CaseModel caseModel;

//   @override
//   Widget build(BuildContext context) {
//     final textStyle = context.textTheme.titleMedium?.apply(color: Colors.white);

//     final side = caseModel.side?.substring(0, 1).toUpperCase();

//     // final Widget diagnosis = Text(
//     //   caseModel.diagnosis?.sentenceCase ?? '',
//     //   style: context.textTheme.titleLarge?.apply(color: Colors.white),
//     //   overflow: TextOverflow.ellipsis,
//     // );

//     final surgery = side == null
//         ? Text(caseModel.surgery!.sentenceCase, style: textStyle)
//         : RichText(
//             overflow: TextOverflow.ellipsis,
//             maxLines: 1,
//             text: TextSpan(
//               text: side,
//               style: textStyle?.apply(fontWeightDelta: 2),
//               children: <TextSpan>[
//                 const TextSpan(text: ' '),
//                 TextSpan(
//                   text: caseModel.surgery!.sentenceCase,
//                   style: textStyle,
//                 ),
//               ],
//             ),
//           );

//     final Widget dos = Text(
//       'surgery on - ${caseModel.surgeryDate.formatYMD()}',
//       style: context.textTheme.bodyMedium?.apply(
//         color: Colors.grey[300],
//       ),
//     );

//     return SizedBox(
//       height: kToolbarHeight,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [surgery, dos],
//       ),
//     );
//   }
// }

class _CaseDataAvatar extends StatelessWidget {
  const _CaseDataAvatar(this.caseModel);

  final CaseModel? caseModel;

  @override
  Widget build(BuildContext context) {
    //final textTheme = context.textTheme;
    if (caseModel == null) {
      return const CircleAvatar(radius: 24, child: Spinner());
    }

    if (caseModel!.patientModel == null) {
      return const Center(child: Text('No patient data'));
    }

    return CircleAvatar(
      radius: 24,
      //foregroundColor: Colors.white,
      backgroundColor: caseModel!.patientModel!.gender?.toLowerCase() ==
              S.of(context).genderList.split(',').first
          ? Colors.blue.shade900
          : Colors.pink,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            caseModel!.patientModel?.initials?.toUpperCase() ?? 'JD',
            //style: textTheme.labelSmall?.apply(color: Colors.white),
          ),
          Text(
            caseModel!.patientModel!.yob ?? '--',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
