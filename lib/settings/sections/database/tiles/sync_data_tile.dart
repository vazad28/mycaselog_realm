part of '../database_section.dart';

class SyncDataTile extends StatelessWidget {
  const SyncDataTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
        title: 'Sync Data',
        leading: const Icon(Icons.sync),
        subTitle: 'Sync data locally from server',
        onTap: () => const SyncRoute().push<void>(context),);
  }
}
