import 'package:app_l10n/app_l10n.dart';
import 'package:flutter/material.dart';

import '../domain/dialog_model.dart';
import '../widgets/adaptive_action.dart';

class InfoDialogWidget extends StatelessWidget {
  const InfoDialogWidget({required this.dialogModel, super.key});

  final DialogModel dialogModel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: dialogModel.title != null ? Text(dialogModel.title!) : null,
      content: dialogModel.content,
      actions: <Widget>[
        adaptiveAction(
          context: context,
          onPressed: () => Navigator.pop(context, true),
          child: Text(dialogModel.defaultActionText ?? S.current.ok),
        ),
      ],
    );
  }
}
