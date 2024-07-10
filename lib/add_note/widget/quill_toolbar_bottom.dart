import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuillToolbarBottom extends ConsumerWidget {
  const QuillToolbarBottom({required this.controller, super.key});

  final QuillController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final quillController =
    //     ref.watch(addNoteNotifierProvider.notifier).quillController;

    return QuillToolbar(
      //configurations: const QuillToolbarConfigurations(),
      child: Builder(
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
            ),
            constraints: const BoxConstraints.tightFor(
              height: kMinInteractiveDimension,
            ),
            child: CustomScrollView(
              key: const Key('__quill_toolbar_bottom__key__'),
              scrollDirection: Axis.horizontal,
              //controller: _controller,
              physics: const ClampingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: childrenBuilder(context, controller),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<Widget> childrenBuilder(
    BuildContext context,
    QuillController controller,
  ) {
    return [
      QuillToolbarToggleStyleButton(
        controller: controller,
        attribute: Attribute.bold,
      ),
      QuillToolbarToggleStyleButton(
        controller: controller,
        attribute: Attribute.italic,
      ),
      QuillToolbarToggleStyleButton(
        controller: controller,
        attribute: Attribute.underline,
      ),
      const VerticalDivider(),

      QuillToolbarToggleStyleButton(
        controller: controller,
        attribute: Attribute.strikeThrough,
      ),
      QuillToolbarToggleStyleButton(
        controller: controller,
        attribute: Attribute.small,
      ),

      const VerticalDivider(),
      // QuillToolbarImageButton(
      //   controller: controller,
      // ),
      // QuillToolbarCameraButton(
      //   controller: controller,
      // ),
      // QuillToolbarVideoButton(
      //   controller: controller,
      // ),
      // const VerticalDivider(),
      // QuillToolbarColorButton(
      //   controller: controller,
      //   isBackground: false,
      // ),
      // QuillToolbarColorButton(
      //   controller: controller,
      //   isBackground: true,
      // ),
      //QuillToolbarFontSizeButton(controller: controller),
      // QuillToolbarSelectHeaderStyleButtons(
      //     controller: controller,
      //     options: const QuillToolbarSelectHeaderStyleButtonsOptions(
      //         attributes: [Attribute.h2, Attribute.h3])),
      //const VerticalDivider(),
      // QuillToolbarToggleCheckListButton(
      //   controller: controller,
      // ),
      QuillToolbarToggleStyleButton(
        controller: controller,
        attribute: Attribute.ol,
      ),
      QuillToolbarToggleStyleButton(
        controller: controller,
        attribute: Attribute.ul,
      ),
      // QuillToolbarCustomButton(
      //   controller: controller,
      //   options: QuillToolbarCustomButtonOptions(
      //     onPressed: ()=>  context.openActionsBottomSheet([

      //     ]),
      //     afterButtonPressed:  () => {}
      //   ),
      // ),
      // const VerticalDivider(),
      // QuillToolbarToggleStyleButton(
      //   controller: controller,
      //   attribute: Attribute.blockQuote,
      // ),
      // QuillToolbarSelectHeaderStyleDropdownButton(
      //   controller: controller,
      // ),

      QuillToolbarIndentButton(
        controller: controller,
        isIncrease: true,
      ),
      QuillToolbarIndentButton(
        controller: controller,
        isIncrease: false,
      ),
    ];
  }
}


//Iterable<BaseAppAction?>
