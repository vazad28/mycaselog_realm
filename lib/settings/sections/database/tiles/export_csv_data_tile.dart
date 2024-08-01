part of '../database_section.dart';

class ExportCsvDataTile extends StatelessWidget {
  const ExportCsvDataTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      title: 'Export Data',
      subTitle: 'Generate and email data as CSV file',
      leading: const Icon(Icons.data_array),
      onTap: () {
        showModalBottomSheet<DatabaseIoPage>(
          context: context,
          //isDismissible: false,
          enableDrag: false,
          builder: (_) => const CsvExportPage(),
        );
      },
    );
  }
}
