import 'package:just_play_demo/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

//Simple implementation of shared preferences to store data locally
@lazySingleton
class LocalDataRepository {
  final SharedPreferences _sharedPreferences = getIt<SharedPreferences>();

  LocalDataRepository();

  // Method to get a value from SharedPreferences
  String? getValue(String key) {
    return _sharedPreferences.getString(key);
  }

  // Method to set a value in SharedPreferences
  Future<void> setValue(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  // Method to remove a value from SharedPreferences
  Future<void> deleteValue(String key) async {
    await _sharedPreferences.remove(key);
  }
}

//Keys to be stored
abstract class LocalDataRepositoryKeys {
  static const String loggedUser = 'loggedUser';
}
