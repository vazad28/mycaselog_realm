import 'package:app_annotations/app_annotations.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:misc_packages/misc_packages.dart';
import 'package:recase/recase.dart';

import '../../core/app_vars.dart';
import '../user_profile.dart';

class UserSpecialityWidget extends ConsumerWidget
    with UserProfileEventMixin, UserProfileStateMixin {
  const UserSpecialityWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final speciality = userSpeciality(ref);

    final specialitiesMap = SurgicalSpeciality.values.asNameMap();

    return TextButton(
      child: Text(
        specialitiesMap[speciality]?.name.titleCase ?? 'Select speciality',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      onPressed: () async {
        final items = specialitiesMap.entries
            .map((e) => RadioSelectOption(title: e.value.name, value: e.key))
            .toList();

        final selectedSpeciality = await context.openRadioSelectModal<String>(
          rootContext: AppVars.rootContext,
          modal: RadioSelectModal(
            items: items,
            selectedValue: speciality,
            title: S.of(context).selectSpeciality,
          ),
        );

        if (selectedSpeciality == null) return;

        updateUserSpeciality(ref, selectedSpeciality);
      },
    );
  }
}
