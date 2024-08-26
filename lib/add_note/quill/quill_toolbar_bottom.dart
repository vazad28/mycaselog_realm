import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuillToolbarBottom extends ConsumerWidget {
  const QuillToolbarBottom({required this.quillController, super.key});

  final QuillController quillController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return QuillToolbar(
      configurations: QuillToolbarConfigurations(
        buttonOptions: QuillSimpleToolbarButtonOptions(
          base: QuillToolbarBaseButtonOptions(
            iconTheme: QuillIconTheme(
                iconButtonSelectedData: const IconButtonData().copyWith(
              highlightColor: Theme.of(context).colorScheme.primaryContainer,
            )),
          ),
        ),
      ),
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
                    children: childrenBuilder(context, quillController),
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
      QuillToolbarHistoryButton(
        isUndo: true,
        controller: quillController,
      ),
      QuillToolbarHistoryButton(
        isUndo: false,
        controller: quillController,
      ),
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
      QuillToolbarToggleStyleButton(
        controller: controller,
        attribute: Attribute.ol,
      ),
      QuillToolbarToggleStyleButton(
        controller: controller,
        attribute: Attribute.ul,
      ),
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
