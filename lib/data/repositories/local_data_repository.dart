import 'package:just_play_demo/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LocalDataRepository {
  final SharedPreferences _sharedPreferences = getIt<SharedPreferences>();

  LocalDataRepository();

  // Method to get a configuration value from SharedPreferences
  String? getValue(String key) {
    return _sharedPreferences.getString(key);
  }

  // Method to set a configuration value in SharedPreferences
  Future<void> setValue(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  // Method to remove a configuration value from SharedPreferences
  Future<void> deleteValue(String key) async {
    await _sharedPreferences.remove(key);
  }
}

abstract class LocalDataRepositoryKeys {
  static const String loggedUser = 'loggedUser';
}
