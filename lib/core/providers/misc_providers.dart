import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../generated/core/providers/misc_providers.g.dart';

@Riverpod(keepAlive: true)
String appDirPath(AppDirPathRef ref) {
  throw UnimplementedError('appDirPath not available');
}

// @riverpod
// PackageInfoClient packageInfoClient(PackageInfoClientRef ref) {
//   throw UnimplementedError('Package info client not available');
// }

// @riverpod
// PermissionClient permissionClient(PermissionClientRef ref) {
//   return const PermissionClient();
// }

// @riverpod
// NotificationsRepository notificationsRepository(
//   NotificationsRepositoryRef ref,
// ) {
//   final notificationsClient = FirebaseNotificationsClient(
//     firebaseMessaging: FirebaseMessaging.instance,
//   );

//   final notificationStorage = NotificationsStorage(
//     storage: ref.watch(persistentStorageProvider),
//   );

//   return NotificationsRepository(
//     permissionClient: ref.watch(permissionClientProvider),
//     storage: notificationStorage,
//     notificationsClient: notificationsClient,
//   );
// }

// @riverpod
// AnalyticsRepository analyticsRepository(AnalyticsRepositoryRef ref) {
//   return AnalyticsRepository(FirebaseAnalytics.instance);
// }
