import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

import '../../add_case.dart';

class TemplateDataTabView extends StatelessWidget {
  const TemplateDataTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //const SelectTemplateBar(),
        Divider(
          height: 0.5,
          color: context.colorScheme.primaryContainer,
        ),
        VerticalSpacer.small,
        const AddCaseTemplatedDataForm(),
      ],
    );
  }
}
