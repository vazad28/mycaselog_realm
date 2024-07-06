import 'package:authentication_client/authentication_client.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'database/database_service.dart';

// class AppData {
//   AppData({
//     required Realm realm,
//     required AuthenticationUser user,
//     required SharedPreferences sharedPrefs,
//   })  : _currentUser = user,
//         _databaseService = DatabaseService(user.id, realm, sharedPrefs);

//   /// Local vars encapsulating the two data sources
//   final DatabaseService _databaseService;

//   /// getters for the datasources
//   DatabaseService get databaseService => _databaseService;

//   /// current user for any repository asking for current  USER ID
//   final AuthenticationUser _currentUser;
//   AuthenticationUser get currentUser => _currentUser;
// }
