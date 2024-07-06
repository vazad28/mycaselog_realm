import 'package:app_extensions/app_extensions.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

class CaseTileSpacer extends StatelessWidget {
  const CaseTileSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 6);
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Diagnosis name for case tile
/// ////////////////////////////////////////////////////////////////////
class DiagnosisTile extends StatelessWidget {
  const DiagnosisTile({required this.caseModel, super.key, this.style});

  final CaseModel caseModel;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final textStyle = style ?? context.textTheme.titleMedium;
    return Text(
      caseModel.diagnosis?.sentenceCase ?? S.of(context).noTitle,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: textStyle,
    );
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Surgery tile
/// ////////////////////////////////////////////////////////////////////
class SurgeryTile extends StatelessWidget {
  const SurgeryTile({required this.caseModel, super.key, this.style});

  final CaseModel caseModel;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final textStyle = style ?? context.textTheme.bodyMedium;
    final side = caseModel.side?.toUpperCase(); //.substring(0, 1).

    if (caseModel.surgery == null || side == null) {
      return Text(
        caseModel.surgery?.sentenceCase ?? S.of(context).noTitle,
        style: textStyle,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );
    }

    // ignore: lines_longer_than_80_chars,
    final surgery =
        ' ${caseModel.surgery![0].toUpperCase()}${caseModel.surgery!.substring(1)}';

    return Text.rich(
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      TextSpan(
        children: <InlineSpan>[
          WidgetSpan(
            child: RoundedRect(
              padding: const EdgeInsets.only(left: 6, right: 6),
              color: context.colorScheme.outlineVariant.withAlpha(100),
              child: Text(
                side.toUpperCase(),
                style: context.textTheme.labelSmall,
              ),
            ),
          ),
          TextSpan(
            text: surgery.sentenceCase,
            style: textStyle,
          ),
        ],
      ),
    );
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Case tile leading widget
/// ////////////////////////////////////////////////////////////////////
class LeadingInfo extends StatelessWidget {
  const LeadingInfo({
    required this.width,
    required this.caseModel,
    super.key,
    this.style,
  });

  final CaseModel caseModel;
  final TextStyle? style;
  final double width;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final textStyle = style ?? textTheme.headlineSmall;

    final Color foregroundColor =
        caseModel.patientModel?.gender?.toLowerCase() == 'male'
            ? Colors.blue
            : Colors.pink;

    final leading = Container(
      width: width,
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            caseModel.patientModel?.initials?.toUpperCase() ?? '',
            style: textStyle?.copyWith(color: foregroundColor),
          ),
          const SizedBox(height: 4),
          Text(caseModel.patientModel?.yob ?? '', style: textTheme.bodySmall),
        ],
      ),
    );
    return leading;
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Case tile trailing widget
/// ////////////////////////////////////////////////////////////////////
class TrailingInfo extends StatelessWidget {
  const TrailingInfo({required this.caseModel, super.key, this.style});

  final CaseModel caseModel;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final textStyle =
        style ?? context.textTheme.bodySmall?.apply(fontSizeFactor: 0.9);

    final dos = Text(
      caseModel.surgeryDate.formatMDY(),
      textAlign: TextAlign.right,
      style: textStyle,
    );

    final trailingContent = Container(
      padding: const EdgeInsets.only(right: 12, left: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          dos,
          const SizedBox(height: 6),
        ],
      ),
    );

    return trailingContent;
  }
}

/// ////////////////////////////////////////////////////////////////////
/// Widget to show the case leading and trailing widgets in a row style
/// ////////////////////////////////////////////////////////////////////
class CaseInfoBar extends StatelessWidget {
  const CaseInfoBar({
    required this.caseModel,
    super.key,
    this.compact = false,
    this.leftIndent = 0,
  });

  final CaseModel caseModel;
  final bool compact;
  final double leftIndent;

  @override
  Widget build(BuildContext context) {
    if (caseModel.patientModel == null) {
      return const Text('Patient model is null');
    }

    final textTheme = context.textTheme;

    var timeAgo = caseModel.surgeryDate.timeAgo();

    if (timeAgo.isEmpty) timeAgo = 'today';
    final pod = Text(timeAgo, style: textTheme.bodySmall);

    final dos = Text(
      caseModel.surgeryDate.formatMDY(),
      textAlign: TextAlign.right,
      style: textTheme.bodySmall,
    );

    final Color foregroundColor =
        caseModel.patientModel?.gender?.toLowerCase() == 'male'
            ? Colors.blue
            : Colors.pink;

    if (!compact) {
      final initials = Text(
        caseModel.patientModel?.initials?.toUpperCase() ?? '',
        style: textTheme.titleSmall?.copyWith(color: foregroundColor),
      );
      return Row(
        children: [
          initials,
          const SizedBox(width: 8),
          Text(caseModel.patientModel?.yob ?? '', style: textTheme.bodySmall),
          if (caseModel.patientModel?.yob != null) const DotWidget(),
          if (caseModel.patientModel?.yob != null)
            Text(
              '${DateTime.now().year - int.parse(caseModel.patientModel!.yob!.trim())}y',
              style: textTheme.bodySmall,
            ),
          const Expanded(child: Text('')), //spacer
          dos,
          const DotWidget(),
          pod,
        ],
      );
    }

    final yob = caseModel.patientModel!.yob;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: leftIndent),
        dos,
        if (yob != null) const DotWidget(),
        if (yob != null)
          Text(
            '${DateTime.now().year - int.parse(yob.trim())}y',
            style: textTheme.bodySmall,
          ),
        const Expanded(child: SizedBox(width: 8)),
        pod,
        const SizedBox(width: 16),
      ],
    );
  }
}
