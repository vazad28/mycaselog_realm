// ignore_for_file: require_trailing_commas

import 'package:animations/animations.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../cases/cases.dart';
import '../../../core/app_services.dart';

class CasesSearchResultTile extends ConsumerWidget {
  const CasesSearchResultTile({
    required this.caseModel,
    super.key,
  });
  final CaseModel caseModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Footer for the tile that has partial name in it
    final footer = _DecryptedPatientModel(
      caseModel: caseModel,
    );

    /// Main tile content that has  surgery info bar and  surgery tile
    final Widget tile = SizedBox(
      height: kToolbarHeight * 1.5,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: kToolbarHeight * 0.5,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: CaseInfoBar(caseModel: caseModel),
            ),
          ),
          SizedBox(
            height: kToolbarHeight * 0.5,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SurgeryTile(
                caseModel: caseModel,
                style: context.textTheme.bodyLarge,
              ),
            ),
          ),
          SizedBox(
            height: kToolbarHeight * 0.5,
            child: footer,
          )
        ],
      ),
    );

    final Widget child = OpenContainer(
      closedColor: Colors.transparent,
      closedElevation: 0,
      openBuilder: (context, action) => const Placeholder(),
      // CaseDetailsPage(
      //   caseModel: caseModel,
      // ),
      closedBuilder: (context, action) => tile,
    );

    return MaterialCard.bordered(
      padding: const EdgeInsets.all(6),
      borderColor: context.colorScheme.outline.withAlpha(100),
      child: child,
    );
  }
}

class _DecryptedPatientModel extends ConsumerWidget {
  const _DecryptedPatientModel({
    required this.caseModel,
  });
  final CaseModel caseModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const height = kMinInteractiveDimension * 0.75;
    if (caseModel.patientModel?.crypt == null) {
      return const SizedBox.shrink(
        child: Text('No encrypted data'),
      );
    }

    final encryptionRepository = ref.watch(encryptionServiceProvider);

    final patientModelResult =
        encryptionRepository.decrypt(caseModel.patientModel!.crypt!);

    final child = patientModelResult.when(success: (json) {
      final patientModel = PatientModelX.fromJson(json);

      return Row(
        children: [
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              (patientModel.name ?? '').toUpperCase(),
              style: context.textTheme.titleSmall
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
          )
        ],
      );
    }, failure: (failure) {
      debugPrint(failure.error.toString());
      return const SizedBox(child: Text('Error decrypted data'));
    });

    final Widget widget = Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        child,
        Container(
          margin: EdgeInsets.zero,
          alignment: AlignmentDirectional.centerStart,
          width: 56,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                context.colorScheme.surface.withOpacity(0.2),
                context.colorScheme.surface
              ],
              stops: const [0, 56],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 56),
          padding: const EdgeInsets.only(left: 16, right: 8),
          width: double.infinity,
          alignment: Alignment.centerRight,
          height: height,
          color: context.colorScheme.surface,
          child: Text(
            caseModel.location ?? '',
            style: context.textTheme.bodySmall,
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
    return widget;
  }
}
