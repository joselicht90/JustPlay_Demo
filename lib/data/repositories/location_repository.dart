import 'package:injectable/injectable.dart';
import 'package:just_play_demo/data/models/city.dart';
import 'package:just_play_demo/data/models/country.dart';
import 'package:just_play_demo/data/models/state.dart';
import 'package:just_play_demo/data/services/api_service.dart';

//This is an actual implementation of a repository against a real API
@LazySingleton()
class LocationRepository {
  final ApiService _apiService;

  LocationRepository(this._apiService);

  Future<List<Country>> getCountries() async {
    return _apiService.getCountries();
  }

  Future<List<CountryState>> getStatesByCountry(String country) async {
    return _apiService.getStatesByCountry(country);
  }

  Future<List<City>> getCitiesByState(String country, String state) async {
    return _apiService.getCitiesByState(country, state);
  }
}
