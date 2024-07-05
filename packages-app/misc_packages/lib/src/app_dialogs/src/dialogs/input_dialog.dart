import 'dart:io';

import 'package:app_l10n/app_l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../domain/dialog_model.dart';
import '../widgets/adaptive_action.dart';

/// Input Dialog
class InputDialogWidget extends StatefulWidget {
  const InputDialogWidget({
    required this.dialogModel,
    super.key,
  });

  final InputDialogModel dialogModel;

  @override
  // ignore: library_private_types_in_public_api
  _InputDialogWidgetState createState() => _InputDialogWidgetState();
}

class _InputDialogWidgetState extends State<InputDialogWidget> {
  late TextEditingController _controller;
  late InputDialogModel dialogModel;

  @override
  void initState() {
    dialogModel = widget.dialogModel;

    if (widget.dialogModel.value != null) {
      _controller = TextEditingController(text: widget.dialogModel.value);
    } else {
      _controller = TextEditingController();
    }

    super.initState();
  }

  /// Material input
  Widget get _materialInput => Material(
        child: TextField(
          maxLines: dialogModel.multiline ? null : 1,
          textCapitalization:
              dialogModel.textCapitalization ?? TextCapitalization.sentences,
          keyboardType: dialogModel.multiline
              ? TextInputType.multiline
              : TextInputType.text,
          controller: _controller,
          autofocus: true,
          inputFormatters: dialogModel.inputFormatters,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: Theme.of(context).dialogBackgroundColor,
            labelText: '',
            hintText:
                dialogModel.placeholderText ?? S.current.inputPlaceholderText,
          ),
        ),
      );

  /// Cupertino input
  Widget get _cupertinoInput => Material(
        child: CupertinoTextField(
          maxLines: dialogModel.multiline ? null : 1,
          keyboardType: dialogModel.value.runtimeType == int
              ? TextInputType.number
              : dialogModel.multiline
                  ? TextInputType.multiline
                  : TextInputType.text,
          textCapitalization:
              dialogModel.textCapitalization ?? TextCapitalization.words,
          controller: _controller,
          autofocus: true,
          inputFormatters: dialogModel.inputFormatters,
          obscureText: dialogModel.obscureText,
          placeholder:
              dialogModel.placeholderText ?? S.current.inputPlaceholderText,
          decoration: const BoxDecoration(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: dialogModel.title != null ? Text(dialogModel.title!) : null,
      content: (kIsWeb || !Platform.isIOS) ? _materialInput : _cupertinoInput,
      actions: <Widget>[
        adaptiveAction(
          context: context,
          onPressed: () => Navigator.pop(context),
          child: Text(dialogModel.cancelActionText ?? S.current.cancel),
        ),
        adaptiveAction(
          context: context,
          onPressed: () => Navigator.of(context).pop(_controller.text),
          child: Text(dialogModel.defaultActionText ?? S.current.ok),
        ),
      ],
    );
  }
}
