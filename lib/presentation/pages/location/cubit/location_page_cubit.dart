import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:just_play_demo/data/models/city.dart';
import 'package:just_play_demo/data/models/country.dart';
import 'package:just_play_demo/data/models/state.dart';
import 'package:just_play_demo/data/repositories/location_repository.dart';

part 'location_page_state.dart';

@LazySingleton()
class LocationPageCubit extends Cubit<LocationPageState> {
  final LocationRepository _locationRepository;

  List<Country> countries = [];
  List<CountryState> states = [];
  List<City> cities = [];

  Country? selectedCountry;
  CountryState? selectedState;
  City? selectedCity;

  LocationPageCubit(this._locationRepository) : super(LocationPageInitial());

  Future<void> fetchCountries() async {
    emit(FetchingCountries());
    try {
      selectedCountry = null;
      selectedState = null;
      selectedCity = null;
      countries = await _locationRepository.getCountries();
      countries.sort((a, b) => a.name.compareTo(b.name));

      emit(CountriesFetched(countries: countries));
    } catch (e) {
      emit(LocationPageError(e.toString()));
    }
  }

  Future<void> fetchStates(String countryCode) async {
    emit(FetchingStates(countries: countries));
    try {
      selectedCountry = countries.firstWhere((c) => c.iso2 == countryCode);
      selectedState = null;
      selectedCity = null;
      states = await _locationRepository.getStatesByCountry(countryCode);
      states.sort((a, b) => a.name.compareTo(b.name));
      emit(StatesFetched(countries: countries, states: states));
    } catch (e) {
      emit(LocationPageError(e.toString()));
    }
  }

  Future<void> fetchCities(String stateCode) async {
    emit(FetchingCities(states: states, countries: countries));
    try {
      selectedState = states.firstWhere((s) => s.iso2 == stateCode);
      selectedCity = null;

      cities = await _locationRepository.getCitiesByState(
        selectedCountry!.iso2,
        stateCode,
      );
      cities.sort((a, b) => a.name.compareTo(b.name));

      emit(CitiesFetched(countries: countries, states: states, cities: cities));
    } catch (e) {
      emit(LocationPageError(e.toString()));
    }
  }

  Future<void> selectCity(int cityId) async {
    selectedCity = cities.firstWhere((c) => c.id == cityId);
    emit(CitySelected(
      city: selectedCity!,
      states: states,
      countries: countries,
      cities: cities,
    ));
  }

  Future<void> searchGames() async {
    emit(SearchingGames(
      city: selectedCity,
      states: states,
      countries: countries,
      cities: cities,
    ));
  }
}
