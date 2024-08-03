import 'package:app_extensions/app_extensions.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//import 'package:recase/recase.dart';

import '../../add_case.dart';

class TemplateDataTabView extends StatelessWidget {
  const TemplateDataTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SelectTemplateBar(),
        Divider(
          height: 0.5,
          color: context.colorScheme.primaryContainer,
        ),
        VerticalSpacer.small,
        const TemplatedDataForm(),
      ],
    );
  }
}

class SelectTemplateBar extends ConsumerWidget {
  const SelectTemplateBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currCaseTemplate = ref.watch(currentCaseTemplateProvider);

    final Widget child = InkWell(
      onTap: () {
        /// on Open select template
        context.openDraggableBottomSheet<TemplateModel?>(
          builder: (_) => SelectTemplateBottomSheet(currCaseTemplate),
          offset: 0.8,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const SizedBox(width: 16),
          Text(
            S.of(context).template.titleCase,
            style: context.textTheme.bodyMedium,
          ),
          Expanded(
            child: Text(
              (currCaseTemplate?.title ?? S.of(context).select).sentenceCase,
              textAlign: TextAlign.end,
              overflow: TextOverflow.fade,
              style: context.textTheme.titleMedium,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.unfold_more),
          const SizedBox(width: 8),
        ],
      ),
    );

    return ColoredBox(
      color: context.colorScheme.inversePrimary,
      child: SizedBox(
        height: kMinInteractiveDimension,
        child: child,
      ),
    );
  }
}
