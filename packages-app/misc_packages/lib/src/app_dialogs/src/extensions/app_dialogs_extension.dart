import 'dart:async';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../app_dialogs.dart';
import '../domain/dialog_model.dart';

extension AsyncValueUI on BuildContext {
  /// ////////////////////////////////////////////////////////////////////
  /// Basic dialogs
  /// ////////////////////////////////////////////////////////////////////

  /// Show snackbar extension
  void showSnackBar(String message, [String? actionText]) {
    final colorScheme = Theme.of(this).colorScheme;
    final snackBar = SnackBar(
      duration: Duration(seconds: actionText != null ? 300 : 4),
      content: Text(message),
      backgroundColor: colorScheme.tertiary,
      action: actionText != null
          ? SnackBarAction(
              textColor: colorScheme.onTertiary,
              label: actionText,
              onPressed: () {},
            )
          : null,
    );
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  /// Banner dialog extension
  void showBanner(String? message) {
    final banner = MaterialBanner(
      content: Text(message ?? 'No message'),
      actions: [
        IconButton(
          onPressed: () =>
              ScaffoldMessenger.of(this).hideCurrentMaterialBanner(),
          icon: const Icon(Icons.close),
        ),
      ],
    );
    ScaffoldMessenger.of(this).showMaterialBanner(banner);
  }

  /// info dialog extension
  Future<void> showInfoDialog(String message, [String? title]) {
    return showDialog(
      context: this,
      builder: (ctx) {
        return InfoDialogWidget(
          dialogModel: DialogModel.info(
            Text(message, style: Theme.of(this).textTheme.bodyMedium),
            title,
          ),
        );
      },
    );
  }

  /// confirm dialog extension
  Future<bool> showConfirmDialog(
    String message, {
    String? title,
    String? defaultActionText,
    String? cancelActionText,
  }) {
    return showDialog<bool>(
      context: this,
      builder: (ctx) {
        return ConfirmDialogWidget(
          dialogModel: DialogModel.info(
            Text(message, style: Theme.of(this).textTheme.bodyMedium),
            title,
          ),
        );
      },
    ).then((value) => value ?? false);
  }

  ///
  /// Unsaved form warning
  ///
  Future<bool> unsavedFormWarning(String? title) {
    return showConfirmDialog(
      'You have unsaved data.\n\nAre you sure you want to leave?',
      title: title,
      defaultActionText: 'Yes',
    ).then((res) {
      if (res) return true;
      return false;
    });
  }

  /// show input dialog
  Future<T?> showInputDialog<T>({
    String? title,
    String? value,
    String? defaultActionText,
    String? cancelActionText,
    bool multiline = false,
    List<TextInputFormatter>? inputFormatters,
  }) =>
      showDialog<T?>(
        context: this,
        builder: (_) {
          return InputDialogWidget(
            dialogModel: InputDialogModel(
              title: title,
              value: value,
              multiline: multiline,
              inputFormatters: inputFormatters,
              defaultActionText: defaultActionText,
              cancelActionText: cancelActionText,
            ),
          );
        },
      );

  Future<T?> openOverlay<T>(Widget child) {
    return showGeneralDialog(
      context: this,
      barrierColor: Colors.transparent,
      anchorPoint: Offset.zero,
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return child;
      },
      transitionBuilder: (_, animation, secondaryAnimation, child) {
        return SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.vertical,
          child: child,
        );
      },
    );
  }

  Future<T?> openModalScreen<T>(Widget child) {
    return Navigator.of(this).push(
      PageRouteBuilder(
        fullscreenDialog: true,
        pageBuilder: (_, animation, secondaryAnimation) => child,
        transitionsBuilder: (_, animation, secondaryAnimation, child) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.vertical,
            child: child,
          );
        },
      ),
    );
  }
}
