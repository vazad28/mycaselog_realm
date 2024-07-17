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
    required this.caseModel,
    required this.onTap,
    super.key,
    this.onDoubleTap,
    this.onLongPress,
  });

  final CaseModel caseModel;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: Key('HybridCaseTileCompact-${caseModel.caseID}'),
      builder: (context, constraints) {
        return ConstrainedBox(
          constraints: BoxConstraints(maxHeight: constraints.maxHeight),
          child: InkWell(
            onTap: onTap,
            onLongPress: onLongPress,
            onDoubleTap: onDoubleTap,
            child: _CaseTileCompactLayout(
              caseModel: caseModel,
            ),
          ),
        );
      },
    );
  }
}

class _CaseTileCompactLayout extends StatelessWidget {
  const _CaseTileCompactLayout({required this.caseModel});

  final CaseModel caseModel;

  @override
  Widget build(BuildContext context) {
    const leftIndent = 72.0;
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
        if (caseModel.medias.isNotEmpty) ...[
          Flexible(
            child: MediaPreviewTile(
              caseModel: caseModel,
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
    required this.caseModel,
    required this.onTap,
    super.key,
    this.onDoubleTap,
    this.onLongPress,
    this.dense = false,
  });

  final bool dense;
  final CaseModel caseModel;
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
          child: _HybridCaseCard(caseModel: caseModel, dense: dense),
        ),
      ),
    );
  }
}

class _HybridCaseCard extends StatelessWidget {
  const _HybridCaseCard({
    required this.caseModel,
    this.dense = false,
  });

  final bool dense;
  final CaseModel caseModel;

  @override
  Widget build(BuildContext context) {
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
                    caseModel: caseModel,
                  ),
                  const CaseTileSpacer(),
                  DiagnosisTile(caseModel: caseModel),
                  const CaseTileSpacer(),
                  SurgeryTile(caseModel: caseModel),
                ],
              ),
            ),
          ],
        ),
        ...[
          Flexible(
            child: MediaPreviewTile(
              caseModel: caseModel,
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
    required this.caseModel,
    required this.onTap,
    super.key,
    this.onDoubleTap,
    this.onLongPress,
    this.dense = false,
  });

  final bool dense;
  final CaseModel caseModel;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      child: _HybridCaseCardTile(caseModel: caseModel, dense: dense),
    );
  }
}

class _HybridCaseCardTile extends StatelessWidget {
  const _HybridCaseCardTile({
    required this.caseModel,
    this.dense = false,
  });

  final bool dense;
  final CaseModel caseModel;

  @override
  Widget build(BuildContext context) {
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
                    caseModel: caseModel,
                  ),
                  const CaseTileSpacer(),
                  DiagnosisTile(caseModel: caseModel),
                  const CaseTileSpacer(),
                  SurgeryTile(caseModel: caseModel),
                ],
              ),
            ),
            HorizontalSpacer.large,
          ],
        ),
        Flexible(
          child: MediaPreviewTile(
            caseModel: caseModel,
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
