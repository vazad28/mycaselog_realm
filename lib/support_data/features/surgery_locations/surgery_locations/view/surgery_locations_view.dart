import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../router/routes/routes.dart';
import '../../../../support_data.dart';

class SurgeryLocationsView extends ConsumerWidget
    with SurgeryLocationsEventMixin, SurgeryLocationsStateMixin {
  const SurgeryLocationsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Use watch so that the filter function can update the view
    final surgeryLocations = surgeryLocationsListState(ref);

    if (surgeryLocations.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'No Surgery Locations',
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(AppSpacing.sm),
      itemCount: surgeryLocations.length,
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        indent: AppSpacing.lg,
      ),
      itemBuilder: (_, index) {
        final surgeryLocationModel = surgeryLocations[index];
        return DismissibleListTile(
          title: surgeryLocationModel.name ?? 'No name',
          subTitle: surgeryLocationModel.phone,
          onDismissed: () {
            updateSurgeryLocation(
              ref,
              surgeryLocationModel..removed = 1,
            );
          },
          onTap: () => AddSurgeryLocationRoute(surgeryLocationModel)
              .push<SurgeryLocationModel>(context)
              .then((model) {
            if (model != null) updateSurgeryLocation(ref, model);
          }),
        );
      },
    );
  }
}
