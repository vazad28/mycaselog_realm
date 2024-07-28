import 'package:flutter/material.dart';

import 'material_card.dart';

// ignore: public_member_api_docs
class DismissibleListTile extends StatelessWidget {
  const DismissibleListTile({
    // required this.title,
    required this.child,
    required this.onDismissed,
    // required this.onTap,
    super.key,
    //this.subTitle,
    this.wrapInCard = false,
    //this.trailing,
  });

  final VoidCallback onDismissed;
  //final VoidCallback onTap;
  //final String? subTitle;
  //final String title;
  final bool wrapInCard;
  final Widget child;
  //final Widget? trailing;

  /// important to call this in same file
  Future<bool?> _confirmDelete(
    BuildContext context,
    DismissDirection direction,
  ) {
    return showAdaptiveDialog<bool>(
      context: context,
      builder: (_) {
        return AlertDialog.adaptive(
          content: const Text('Are you sure?'),
          actions: <Widget>[
            TextButton(
              onPressed: () => false,
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => true,
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final widget = Dismissible(
      key: UniqueKey(),
      background: ColoredBox(
        color: colorScheme.primary,
        child: const ListTile(
          leading: Icon(Icons.delete, color: Colors.white, size: 36),
        ),
      ),
      secondaryBackground: ColoredBox(
        color: colorScheme.secondary,
        child: const ListTile(
          trailing: Icon(Icons.delete, color: Colors.white, size: 36),
        ),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (DismissDirection direction) =>
          Future<bool?>.sync(() => true),
      // _confirmDelete(context, direction),
      //     showAdaptiveDialog<bool>(
      //   context: context,
      //   builder: (_) {
      //     return AlertDialog.adaptive(
      //       content: const Text('Are you sure?'),
      //       actions: <Widget>[
      //         TextButton(
      //           onPressed: () => false,
      //           child: const Text('Cancel'),
      //         ),
      //         TextButton(
      //           onPressed: () => true,
      //           child: const Text('OK'),
      //         ),
      //       ],
      //     );
      //   },
      // ),
      onDismissed: (direction) => onDismissed.call(),
      child: child,
    );

    if (wrapInCard) {
      return MaterialCard.outlined(
        margin: const EdgeInsets.all(6),
        padding: EdgeInsets.zero,
        borderColor: Theme.of(context).colorScheme.outline,
        child: widget,
      );
    }
    return widget;
  }
}
