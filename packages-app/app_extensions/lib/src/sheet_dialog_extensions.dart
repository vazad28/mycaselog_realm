import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

/// Base class
abstract class BaseAppAction {
  BaseAppAction({
    required this.action,
    required this.title,
    this.isActive = false,
    this.leading,
    this.subTitle,
    this.trailing,
  });

  final bool isActive;
  final dynamic action;
  final Widget? leading;
  final String? subTitle;
  final String? title;
  final Widget? trailing;
}

extension SheetDialogFunctions on BuildContext {
  Future<T?> openDraggableBottomSheet<T>({
    required Widget Function(BuildContext) builder,
    double offset = 0.9,
    bool useRootNavigator = false,
  }) async {
    final ctx = this;
    return showModalBottomSheet<T>(
      backgroundColor: Colors.transparent,
      context: ctx,
      isScrollControlled: true,
      elevation: 0,
      //useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(kRadialReactionRadius),
          topRight: Radius.circular(kRadialReactionRadius),
        ),
      ),
      builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.pop(context),
          child: ColoredBox(
            color: Colors.transparent, //critical to allow tap to close
            child: FractionallySizedBox(
              heightFactor: offset,
              child: builder(context),
            ),
          ),
        );
      },
    );
  }

  /// show bottom sheet
  Future<T?> openModalBottomSheet<T>({
    required Widget Function(BuildContext) builder,
    bool isDismissible = true,
    bool isScrollcontrolled = false,
    VoidCallback? onDone,
    bool? useRootNavigator,
  }) async {
    final ctx = this;
    final theme = Theme.of(ctx);
    return showModalBottomSheet<T>(
      isDismissible: isDismissible,
      isScrollControlled: isScrollcontrolled,
      context: ctx,
      backgroundColor: theme.colorScheme.surface,
      useRootNavigator: useRootNavigator ?? false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(kRadialReactionRadius),
          topRight: Radius.circular(kRadialReactionRadius),
        ),
      ),
      //useRootNavigator: true,
      builder: (ctx) {
        return builder(ctx);
      },
    );
  }

  Future<BaseAppAction?> openActionsBottomSheet(
    Iterable<BaseAppAction> actions, {
    String? title,
    bool showIndicator = false,
  }) {
    final ctx = this;

    return showModalBottomSheet<BaseAppAction?>(
      context: ctx,
      //backgroundColor: ctx.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(kRadialReactionRadius),
          topRight: Radius.circular(kRadialReactionRadius),
        ),
      ),
      useRootNavigator: true,
      builder: (_) => SafeArea(
        child: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 16),
          itemCount: actions.length,
          separatorBuilder: (context, index) => Divider(
            height: 1,
            indent: actions.first.leading == null ? 64 : 16,
          ),
          itemBuilder: (context, index) {
            final action = actions.elementAt(index);
            return ListTile(
              leading: action.leading,
              title: Text(action.title?.titleCase ?? 'No title'),
              subtitle: action.subTitle != null ? Text(action.subTitle!) : null,
              trailing: action.trailing,
              onTap: () => Navigator.of(context).pop(action),
            );
          },
        ),
      ),
    );
  }
}
