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

  LocationPageCubit(this._locationRepository) : super(LocationPageInitial());

  Future<void> fetchCountries() async {
    emit(FetchingCountries());
    try {
      countries = await _locationRepository.getCountries();
      emit(CountriesFetched(countries: countries));
    } catch (e) {
      emit(LocationPageError(e.toString()));
    }
  }
}
