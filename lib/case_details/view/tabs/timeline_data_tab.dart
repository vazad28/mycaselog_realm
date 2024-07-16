import 'package:app_ui/app_ui.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../case_timeline/case_timeline.dart';
import '../../provider/case_details_provider.dart';

class CaseDetailsTimelineTab extends ConsumerWidget {
  const CaseDetailsTimelineTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final caseDetails = ref.watch(caseDetailsNotifierProvider);

    const kChatInputBoxHeight = kToolbarHeight + kToolbarHeight * 0.5;

    return caseDetails.maybeWhen(
      orElse: () => const Loading(),
      data: (caseModel) => Stack(
        children: [
          Builder(
            builder: (context) => CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Container(
                    alignment: AlignmentDirectional.topStart,
                    padding: const EdgeInsets.only(left: kToolbarHeight - 11),
                    width: 4,
                    height: kToolbarHeight * 2,
                    child: VerticalDivider(
                      color: context.colorScheme.surfaceContainerHighest,
                      thickness: 2,
                      width: kMinInteractiveDimension * 0.5,
                    ),
                  ),
                ),
                CaseTimelinePage(
                  key: Key('CaseTimelineScreen-${caseModel.caseID}'),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: kChatInputBoxHeight),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              width: double.infinity,
              height: kChatInputBoxHeight,
              child: TimelineChatInput(caseModel: caseModel),
              //),
            ),
          ),
        ],
      ),
    );
  }
}

// class _TimelineBackgroundWidget extends ConsumerWidget with CaseDetailsMixin {
//   const _TimelineBackgroundWidget({required this.caseModel});

//   final CaseModel caseModel;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final isTimelineEmpty = ref.watch(isTimelineEmptyProvider(caseModel));

//     return isTimelineEmpty
//         ? Center(
//             child: SizedBox(
//               // same as the height of chatinput to keep in in center of view excluding chat input
//               height: kToolbarHeight + MediaQuery.of(context).padding.bottom,
//               width: double.infinity,
//               child: const Text(
//                 'No Timeline Event',
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           )
//         : Container(
//             padding: const EdgeInsets.only(left: kToolbarHeight),
//             width: 4,
//             height: kToolbarHeight * 2,
//             child: VerticalDivider(
//               color: Theme.of(context).colorScheme.surfaceContainerHighest,
//               thickness: 2,
//               width: AppSpacing.sm,
//             ),
//           );
//   }
// }
