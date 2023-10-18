import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:just_play_demo/app_setup.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
  throwOnMissingDependencies: true,
)
Future<void> configureDependencies() async => await getIt.init();

@module
abstract class InjectableModule {
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}

@module
abstract class DioProvider {
  @singleton
  Dio dio() {
    Dio dio = Dio();
    dio.options.headers = {
      AppConfigs.apiKeyHeader: AppConfigs.apiKey,
    };
    dio.options.baseUrl = AppConfigs.baseUrl;
    return dio;
  }
}
