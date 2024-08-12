part of '../database_section.dart';

class UpgradeDatabaseTile extends ConsumerWidget {
  const UpgradeDatabaseTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SettingsTile(
      title: 'Upgrade Database',
      leading: const Icon(Icons.upgrade),
      subTitle: 'Sync data locally from server',
      onTap: () {
        updatePatientNameRealm(ref).then((_) {
          ref.read(dialogServiceProvider).showSnackBar('Upgrade successful');
        });
      },
    );
  }

  Future<void> updatePatientNameRealm(WidgetRef ref) async {
    final realm = (await ref.watch(realmDatabaseProvider.future)).realm;

    final patients = realm.all<PatientModel>();
    ref.watch(dbProvider).casesCollection.ignoreRealmChanges = true;

    realm.write(() {
      for (final e in patients) {
        if (e.crypt == null) continue;
        final result = ref.watch(decryptPatientModelProvider(e.crypt!));

        final patientModelDecrypted = result.getOrNull();
        print(patientModelDecrypted?.name);
        if (patientModelDecrypted == null) continue;
        e.name = patientModelDecrypted.name;
      }
    });
    await delay(2000);
    ref.watch(dbProvider).casesCollection.ignoreRealmChanges = false;
  }

  Future<void> updateCasesWithPatientIDFromRealm(WidgetRef ref) async {
    try {
      final results = ref.watch(dbProvider).casesCollection.getAll();
      final batch = ref.watch(dbProvider).casesCollection.firestore.batch();

      for (final caseModel in results) {
        if (caseModel.patientModel == null) continue;
        //final patientID = caseModel.patientModel!.patientID;
        final docRef = ref
            .watch(dbProvider)
            .casesCollection
            .collectionRef
            .doc(caseModel.caseID); // Assuming caseId exists

        batch
            .update(docRef, {'patientModel': caseModel.patientModel!.toJson()});
      }

      await batch.commit();
    } catch (e) {
      // Handle errors, e.g.,
      print(e);
    }
  }
}
