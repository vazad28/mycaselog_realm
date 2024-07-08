part of '../database_section.dart';

class ReindexSearchTile extends StatelessWidget {
  const ReindexSearchTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      title: 'Re-Index search',
      subTitle: 'Re-create the full-text search database',
      leading: const Icon(Icons.manage_search),
      onTap: () {
        // showModalBottomSheet<FtsBuilderPage>(
        //   context: context,
        //   builder: (_) => const FtsBuilderPage(),
        // );
      },
    );
  }
}
