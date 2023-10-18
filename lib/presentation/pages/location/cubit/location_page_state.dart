part of 'location_page_cubit.dart';

sealed class LocationPageState extends Equatable {
  const LocationPageState();

  @override
  List<Object> get props => [];
}

final class LocationPageInitial extends LocationPageState {}

final class LocationPageError extends LocationPageState {
  final String message;

  const LocationPageError(this.message);

  @override
  List<Object> get props => [message];
}

final class FetchingCountries extends LocationPageState {}

final class FetchingStates extends LocationPageState {}

final class FetchingCities extends LocationPageState {}

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
