import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../router/routes/routes.dart';
import '../../support_data.dart';

part '../../../generated/support_data/features/surgery_locations/surgery_locations_page.g.dart';

/// ////////////////////////////////////////////////////////////////////
/// Providers
/// ////////////////////////////////////////////////////////////////////

/// Provider to keep the state of SurgeryLocations
@riverpod
List<SurgeryLocationModel> surgeryLocationsList(SurgeryLocationsListRef ref) {
  final surgeryLocations = ref.watch(
    supportDataNotifierProvider.select(
      (value) => value.surgeryLocations
          .where((element) => element.removed == 0)
          .toList(),
    ),
  );

  return surgeryLocations;
}

class SurgeryLocationsPage extends ConsumerWidget {
  const SurgeryLocationsPage({super.key});

  static Page<void> page() =>
      const MaterialPage<void>(child: SurgeryLocationsPage());

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
              AddSurgeryLocationRoute(SurgeryLocationModelX.zero(),
                      newRecord: true)
                  .push<SurgeryLocationModel>(context);
            },
          ),
        ],
      ),
      body: const _SurgeryLocationsView(),
    );
  }
}

class _SurgeryLocationsView extends ConsumerWidget {
  const _SurgeryLocationsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Use watch so that the filter function can update the view
    final surgeryLocations = ref.watch(surgeryLocationsListProvider);

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
                .upsertSurgeryLocation(surgeryLocation..removed = 1);
          },
          onTap: () => AddSurgeryLocationRoute(surgeryLocation)
              .push<SurgeryLocationModel>(context),
        );
      },
    );
  }
}
