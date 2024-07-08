part of '../database_section.dart';

///
/// Import database settings tile
///
class DatabaseIoTile extends StatelessWidget {
  const DatabaseIoTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      title: 'Database Import/Export',
      subTitle: 'Import/Export database from/to a file',
      leading: const Icon(Icons.label_important_rounded),
      onTap: () {
        // showModalBottomSheet<DatabaseIoPage>(
        //   context: context,
        //   //isDismissible: false,
        //   enableDrag: true,
        //   builder: (_) => const DatabaseIoPage(),
        // );
      },
    );
  }
}
