import 'package:flutter/material.dart';

class DraggableBottomSheetBuilder extends StatelessWidget {
  const DraggableBottomSheetBuilder({
    super.key,
    this.title,
    this.child,
    this.itemCount = 0,
    this.itemBuilder,
    this.divider,
  }) : assert(
          (itemBuilder != null && child == null) ||
              (itemBuilder == null && child != null),
          "Both items builder and child can't be null",
        );

  final Widget Function(BuildContext context, int index)? itemBuilder;
  final Widget? child;
  final Divider? divider;
  final int itemCount;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.3,
      snap: true,
      builder: (BuildContext context, ScrollController controller) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(kRadialReactionRadius),
            topRight: Radius.circular(kRadialReactionRadius),
          ),
          child: child ??
              ColoredBox(
                color: title != null
                    ? colorScheme.surfaceContainerHighest
                    : colorScheme.surface,
                child: Column(
                  children: <Widget>[
                    if (title != null) title!,
                    Expanded(
                      child: ColoredBox(
                        color: colorScheme.surface,
                        child: ListView.separated(
                          controller: controller,
                          padding: const EdgeInsets.only(top: 8),
                          itemCount: itemCount,
                          separatorBuilder: (context, index) =>
                              divider ??
                              Divider(
                                height: 0,
                                thickness: 0,
                                color: colorScheme.surface,
                              ),
                          itemBuilder: itemBuilder!,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
        );
      },
    );
  }
}
