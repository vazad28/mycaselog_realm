// ignore_for_file: require_trailing_commas

import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

import '../../cases.dart';
//import 'media_preview_tile.dart';

/// ////////////////////////////////////////////////////////////////////
/// Hybrid case tile in compact format with leading and trailing
/// Two version of it Dense and non dense
/// Dense version is used for the stats screen bottom sheet
/// ////////////////////////////////////////////////////////////////////
class HybridCaseTile extends StatelessWidget {
  const HybridCaseTile({
    required this.hybridCaseModel,
    required this.onTap,
    super.key,
    this.onDoubleTap,
    this.onLongPress,
  });

  final HybridCaseModel hybridCaseModel;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: Key('HybridCaseTileCompact-${hybridCaseModel.caseModel.caseID}'),
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: constraints.maxHeight),
          child: InkWell(
            onTap: onTap,
            onLongPress: onLongPress,
            onDoubleTap: onDoubleTap,
            child: _CaseTileCompactLayout(
              hybridCaseModel: hybridCaseModel,
            ),
          ),
        );
      },
    );
  }
}

class _CaseTileCompactLayout extends StatelessWidget {
  const _CaseTileCompactLayout({required this.hybridCaseModel});

  final HybridCaseModel hybridCaseModel;

  @override
  Widget build(BuildContext context) {
    const leftIndent = 72.0;
    final caseModel = hybridCaseModel.caseModel;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        VerticalSpacer.large,
        CaseInfoBar(
          caseModel: caseModel,
          compact: true,
          leftIndent: leftIndent,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            LeadingInfo(caseModel: caseModel, width: leftIndent),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DiagnosisTile(caseModel: caseModel),
                  const CaseTileSpacer(),
                  SurgeryTile(caseModel: caseModel)
                ],
              ),
            ),
          ],
        ),
        if (hybridCaseModel.mediaModels.isNotEmpty) ...[
          Flexible(
            child: MediaPreviewTile(
              hybridCaseModel: hybridCaseModel,
              leftPadding: leftIndent,
            ),
          ),
        ],
        VerticalSpacer.large,
        Divider(
          indent: leftIndent,
          height: 1,
          color: Theme.of(context).colorScheme.outline.withAlpha(100),
          thickness: 0.5,
        )
      ],
    );
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Hbrid case tile CARD
/// ////////////////////////////////////////////////////////////////////
class HybridCaseCard extends StatelessWidget {
  const HybridCaseCard({
    required this.hybridCaseModel,
    required this.onTap,
    super.key,
    this.onDoubleTap,
    this.onLongPress,
    this.dense = false,
  });

  final bool dense;
  final HybridCaseModel hybridCaseModel;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadialReactionRadius),
        ),
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        child: MaterialCard.outlined(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child:
              _HybridCaseCard(hybridCaseModel: hybridCaseModel, dense: dense),
        ),
      ),
    );
  }
}

class _HybridCaseCard extends StatelessWidget {
  const _HybridCaseCard({
    required this.hybridCaseModel,
    this.dense = false,
  });

  final bool dense;
  final HybridCaseModel hybridCaseModel;

  @override
  Widget build(BuildContext context) {
    final caseModel = hybridCaseModel.caseModel;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CaseInfoBar(
                    caseModel: hybridCaseModel.caseModel,
                  ),
                  const CaseTileSpacer(),
                  DiagnosisTile(caseModel: caseModel),
                  const CaseTileSpacer(),
                  SurgeryTile(caseModel: hybridCaseModel.caseModel),
                ],
              ),
            ),
          ],
        ),
        ...[
          Flexible(
            child: MediaPreviewTile(
              hybridCaseModel: hybridCaseModel,
              leftPadding: 16,
            ),
          ),
        ],
        //const SizedBox(height: 8),
      ],
    );
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Another case tile style
/// ////////////////////////////////////////////////////////////////////
class HybridCaseCardTile extends StatelessWidget {
  const HybridCaseCardTile({
    required this.hybridCaseModel,
    required this.onTap,
    super.key,
    this.onDoubleTap,
    this.onLongPress,
    this.dense = false,
  });

  final bool dense;
  final HybridCaseModel hybridCaseModel;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      child:
          _HybridCaseCardTile(hybridCaseModel: hybridCaseModel, dense: dense),
    );
  }
}

class _HybridCaseCardTile extends StatelessWidget {
  const _HybridCaseCardTile({
    required this.hybridCaseModel,
    this.dense = false,
  });

  final bool dense;
  final HybridCaseModel hybridCaseModel;

  @override
  Widget build(BuildContext context) {
    final caseModel = hybridCaseModel.caseModel;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        VerticalSpacer.large,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HorizontalSpacer.large,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CaseInfoBar(
                    caseModel: hybridCaseModel.caseModel,
                  ),
                  const CaseTileSpacer(),
                  DiagnosisTile(caseModel: caseModel),
                  const CaseTileSpacer(),
                  SurgeryTile(caseModel: hybridCaseModel.caseModel),
                ],
              ),
            ),
            HorizontalSpacer.large,
          ],
        ),
        Flexible(
          child: MediaPreviewTile(
            hybridCaseModel: hybridCaseModel,
            leftPadding: AppSpacing.lg,
          ),
        ),
        VerticalSpacer.large,
        Divider(
          height: 1,
          indent: AppSpacing.lg,
          endIndent: AppSpacing.lg,
          color: Theme.of(context).colorScheme.outline.withAlpha(100),
          thickness: 0.5,
        ),
      ],
    );
  }
}
