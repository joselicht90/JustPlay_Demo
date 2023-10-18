import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:just_play_demo/data/models/city.dart';
import 'package:just_play_demo/data/models/country.dart';
import 'package:just_play_demo/data/models/state.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

//This is a service, it's function is to be the implementation of api calls
// with retrofit we can automate the process of making api endpoints
@injectable
@RestApi()
abstract class ApiService {
  static const getCountriesEndpoint = '/countries';
  static const getStatesByCountryEndpoint = '/countries/{country}/states';
  static const getCitiesByStateEndpoint =
      '/countries/{country}/states/{state}/cities';

  @factoryMethod
  factory ApiService(Dio dio) = _ApiService;

  @GET(getCountriesEndpoint)
  Future<List<Country>> getCountries();

  @GET(getStatesByCountryEndpoint)
  Future<List<CountryState>> getStatesByCountry(
      @Path('country') String country);

  @GET(getCitiesByStateEndpoint)
  Future<List<City>> getCitiesByState(
    @Path('country') String country,
    @Path('state') String state,
  );
}
