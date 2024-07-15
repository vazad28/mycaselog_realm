import 'package:app_extensions/app_extensions.dart';
import 'package:flutter/material.dart';

/// Cases actions
enum CaseDetailsActionEnum {
  duplicateCase,
  deleteCase,
  generateCasePdf,
}

class CaseDetailsAction extends BaseAppAction {
  CaseDetailsAction({
    required CaseDetailsActionEnum super.action,
    String? title,
    super.isActive,
    super.leading,
    super.subTitle,
    super.trailing,
  }) : super(title: title ?? action.name);
}

Map<String, CaseDetailsAction> get caseDetailsActions => {
      CaseDetailsActionEnum.generateCasePdf.name: CaseDetailsAction(
        action: CaseDetailsActionEnum.generateCasePdf,
        leading: const Icon(
          Icons.picture_as_pdf,
        ),
      ),
      CaseDetailsActionEnum.duplicateCase.name: CaseDetailsAction(
        action: CaseDetailsActionEnum.duplicateCase,
        leading: const Icon(
          Icons.copy,
        ),
      ),
      CaseDetailsActionEnum.deleteCase.name: CaseDetailsAction(
        action: CaseDetailsActionEnum.deleteCase,
        leading: const Icon(
          Icons.delete,
        ),
      ),
    };
