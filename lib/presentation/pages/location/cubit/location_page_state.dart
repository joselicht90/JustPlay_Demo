part of 'location_page_cubit.dart';

sealed class LocationPageState extends Equatable {
  const LocationPageState();

  @override
  List<Object> get props => [];
}

final class LocationPageInitial extends LocationPageState {}

final class LocationPageError extends LocationPageState {
  final String error;

  const LocationPageError(this.error);

  @override
  List<Object> get props => [error];
}

final class FetchingCountries extends LocationPageState {}

final class FetchingStates extends CountriesFetched {
  const FetchingStates({required List<Country> countries})
      : super(countries: countries);
}

final class FetchingCities extends StatesFetched {
  const FetchingCities({
    required List<CountryState> states,
    required List<Country> countries,
  }) : super(states: states, countries: countries);
}

final class CountriesFetched extends LocationPageState {
  final List<Country> countries;

  const CountriesFetched({required this.countries});

  @override
  List<Object> get props => [countries];
}

final class StatesFetched extends CountriesFetched {
  final List<CountryState> states;

  const StatesFetched({
    required this.states,
    required List<Country> countries,
  }) : super(countries: countries);

  @override
  List<Object> get props => [states, countries];
}

final class CitiesFetched extends StatesFetched {
  final List<City> cities;

  const CitiesFetched({
    required this.cities,
    required List<CountryState> states,
    required List<Country> countries,
  }) : super(states: states, countries: countries);

  @override
  List<Object> get props => [cities, states, countries];
}

final class CitySelected extends CitiesFetched {
  final City city;

  const CitySelected({
    required this.city,
    required List<CountryState> states,
    required List<Country> countries,
    required List<City> cities,
  }) : super(states: states, countries: countries, cities: cities);

  @override
  List<Object> get props => [city, states, countries, cities];
}

final class SearchingGames extends CitySelected {
  const SearchingGames({
    required City city,
    required List<CountryState> states,
    required List<Country> countries,
    required List<City> cities,
  }) : super(
          city: city,
          states: states,
          countries: countries,
          cities: cities,
        );
}
