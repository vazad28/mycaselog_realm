import 'package:app_annotations/app_annotations.dart';
import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';

import '../../../router/routes/routes.dart';
import '../../support_data.dart';

class SurgeryLocationsPage extends ConsumerWidget {
  const SurgeryLocationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 1,
        title: Text(S.of(context).surgeryLocationsTitle.titleCase),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              AddSurgeryLocationRoute().push<SurgeryLocationModel>(context);
            },
          ),
        ],
      ),
      body: const _SurgeryLocationsView(),
    );
  }
}

class _SurgeryLocationsView extends ConsumerWidget {
  const _SurgeryLocationsView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Use watch so that the filter function can update the view
    final surgeryLocations = ref.watch(
      supportDataNotifierProvider.select(
        (value) => value.surgeryLocations.toList(),
      ),
    );

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
        final surgeryLocation = surgeryLocations[index];
        return DismissibleListTile(
          title: surgeryLocation.name ?? 'No name',
          subTitle: surgeryLocation.phone,
          onDismissed: () {
            ref
                .watch(supportDataNotifierProvider.notifier)
                .upsertSurgeryLocation(surgeryLocation, CrudAction.remove);
          },
          onTap: () =>
              AddSurgeryLocationRoute(locationID: surgeryLocation.locationID)
                  .push<SurgeryLocationModel>(context),
        );
      },
    );
  }
}
