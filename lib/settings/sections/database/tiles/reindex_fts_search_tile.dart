part of '../database_section.dart';

class ReindexSearchTile extends ConsumerWidget {
  const ReindexSearchTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SettingsTile(
      title: 'Re-Index search',
      subTitle: 'Re-create the full-text search database',
      leading: const Icon(Icons.manage_search),
      onTap: () {
        //ref.watch(dbProvider).casesCollection.addPatientIdIfNotExist();
        // showModalBottomSheet<FtsBuilderPage>(
        //   context: context,
        //   builder: (_) => const FtsBuilderPage(),
        // );
      },
    );
  }
}
