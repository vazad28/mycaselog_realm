import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class QuillToolbarBottom extends StatelessWidget {
  const QuillToolbarBottom({required this.controller, super.key});
  final QuillController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
        ),
        constraints: const BoxConstraints.tightFor(
          height: kMinInteractiveDimension,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: childrenBuilder(context, controller),
          ),
        ));
  }

// class QuillToolbarBottom extends ConsumerWidget {
//   const QuillToolbarBottom({required this.quillController, super.key});

//   final QuillController quillController;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return QuillToolbar(
//       controller: quillController,
//       config : QuillSimpleToolbarConfig(
//         buttonOptions: QuillSimpleToolbarButtonOptions(
//           base: QuillToolbarBaseButtonOptions(
//             iconTheme: QuillIconTheme(
//                 iconButtonSelectedData: const IconButtonData().copyWith(
//               highlightColor: Theme.of(context).colorScheme.primaryContainer,
//             )),
//           ),
//         ),
//       ),
//       child: Builder(
//         builder: (context) {
//           return Container(
//             decoration: BoxDecoration(
//               color: Theme.of(context).canvasColor,
//             ),
//             constraints: const BoxConstraints.tightFor(
//               height: kMinInteractiveDimension,
//             ),
//             child: CustomScrollView(
//               key: const Key('__quill_toolbar_bottom__key__'),
//               scrollDirection: Axis.horizontal,
//               //controller: _controller,
//               physics: const ClampingScrollPhysics(),
//               slivers: [
//                 SliverFillRemaining(
//                   hasScrollBody: false,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: childrenBuilder(context, quillController),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }

  List<Widget> childrenBuilder(
    BuildContext context,
    QuillController controller,
  ) {
    return [
      QuillToolbarHistoryButton(
        controller: controller,
        isUndo: true,
        options: const QuillToolbarHistoryButtonOptions(
          iconData: Icons.undo,
          tooltip: 'Undo',
        ),
      ),
      QuillToolbarHistoryButton(
        controller: controller,
        isUndo: false,
        options: const QuillToolbarHistoryButtonOptions(
          iconData: Icons.redo,
          tooltip: 'Redo',
        ),
      ),
      QuillToolbarToggleStyleButton(
        controller: controller,
        attribute: Attribute.bold,
        options: const QuillToolbarToggleStyleButtonOptions(
          iconData: Icons.format_bold,
          tooltip: 'Bold',
        ),
      ),
      QuillToolbarToggleStyleButton(
        controller: controller,
        attribute: Attribute.italic,
        options: const QuillToolbarToggleStyleButtonOptions(
          iconData: Icons.format_italic,
          tooltip: 'Italic',
        ),
      ),
      QuillToolbarToggleStyleButton(
        controller: controller,
        attribute: Attribute.underline,
        options: const QuillToolbarToggleStyleButtonOptions(
          iconData: Icons.format_underline,
          tooltip: 'Underline',
        ),
      ),
      const VerticalDivider(),
      QuillToolbarToggleStyleButton(
        controller: controller,
        attribute: Attribute.strikeThrough,
        options: const QuillToolbarToggleStyleButtonOptions(
          iconData: Icons.format_strikethrough,
          tooltip: 'Strike Through',
        ),
      ),
      QuillToolbarToggleStyleButton(
        controller: controller,
        attribute: Attribute.small,
        options: const QuillToolbarToggleStyleButtonOptions(
          iconData: Icons.text_format,
          tooltip: 'Small Text',
        ),
      ),
      const VerticalDivider(),
      QuillToolbarToggleStyleButton(
        controller: controller,
        attribute: Attribute.ol,
        options: const QuillToolbarToggleStyleButtonOptions(
          iconData: Icons.format_list_numbered,
          tooltip: 'Ordered List',
        ),
      ),
      QuillToolbarToggleStyleButton(
        controller: controller,
        attribute: Attribute.ul,
        options: const QuillToolbarToggleStyleButtonOptions(
          iconData: Icons.format_list_bulleted,
          tooltip: 'Unordered List',
        ),
      ),
      QuillToolbarIndentButton(
        controller: controller,
        isIncrease: true,
        options: const QuillToolbarIndentButtonOptions(
          iconData: Icons.arrow_right,
          tooltip: 'Increase Indent',
        ),
      ),
      QuillToolbarIndentButton(
        controller: controller,
        isIncrease: false,
        options: const QuillToolbarIndentButtonOptions(
          iconData: Icons.arrow_left,
          tooltip: 'Decrease Indent',
        ),
      ),
    ];
  }
}
