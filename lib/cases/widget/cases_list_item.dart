import 'dart:async';

import 'package:animations/animations.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

import '../../case_details/case_details.dart';
import '../../router/router.dart';
import '../cases.dart';

class CasesListItem extends StatelessWidget {
  const CasesListItem({
    required this.hybridCaseModel,
    required this.caseTileStyle,
    super.key,
  });

  final HybridCaseModel hybridCaseModel;
  final int caseTileStyle;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fadeThrough,
      closedColor: context.colorScheme.surface,
      openColor: context.colorScheme.surface,
      closedElevation: 0,
      openBuilder: (context, action) {
        return CaseDetailsPage(caseID: hybridCaseModel.caseModel.caseID);
      },
      tappable: false,
      closedBuilder: (context, action) {
        switch (caseTileStyle) {
          case 0:
            return HybridCaseCardTile(
              hybridCaseModel: hybridCaseModel,
              onTap: action,
              onDoubleTap: () =>
                  _onDoubleTap(context, hybridCaseModel.caseModel),
              onLongPress: () =>
                  _onLongPress(context, hybridCaseModel.caseModel),
            );
          case 1:
            return HybridCaseCard(
              hybridCaseModel: hybridCaseModel,
              onTap: action,
              onDoubleTap: () =>
                  _onDoubleTap(context, hybridCaseModel.caseModel),
              onLongPress: () =>
                  _onLongPress(context, hybridCaseModel.caseModel),
            );
          default:
            return HybridCaseTile(
              hybridCaseModel: hybridCaseModel,
              onTap: action,
              onDoubleTap: () =>
                  _onDoubleTap(context, hybridCaseModel.caseModel),
              onLongPress: () =>
                  () => _onLongPress(context, hybridCaseModel.caseModel),
            );
        }
      },
    );
  }

  FutureOr _onDoubleTap(
    BuildContext context,
    CaseModel caseModel,
  ) {
    return AddCaseRoute(caseModel).push<void>(context);
  }

  FutureOr _onLongPress(
    BuildContext context,
    CaseModel caseModel,
  ) {
    // return context.openModalBottomSheet(
    //   builder: (ctx) => CallPatientModal(caseModel),
    // );
  }
}
