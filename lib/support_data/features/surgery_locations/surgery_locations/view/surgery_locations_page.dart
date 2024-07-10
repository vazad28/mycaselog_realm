import 'package:app_l10n/app_l10n.dart';
import 'package:app_models/app_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';

import '../../../../../router/routes/routes.dart';
import '../../../../support_data.dart';

class SurgeryLocationsPage extends ConsumerWidget
    with SurgeryLocationsEventMixin {
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
        // bottom: ListFilterBar(
        //   onChanged: (filterText) => filterSurgeryLocations(ref, filterText),
        //   hintText: 'Filter surgery locations',
        // ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              AddSurgeryLocationRoute(
                SurgeryLocationModelX.zero(),
                newRecord: true,
              )
                  .push<SurgeryLocationModel?>(context)
                  .then((surgeryLocationModel) {
                if (surgeryLocationModel == null) return;
                updateSurgeryLocation(ref, surgeryLocationModel);
              });
            },
          ),
        ],
      ),
      body: const SurgeryLocationsView(),
    );
  }
}
