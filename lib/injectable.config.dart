// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import 'data/global_blocs/auth_cubit.dart' as _i12;
import 'data/models/city.dart' as _i6;
import 'data/repositories/auth_repository.dart' as _i10;
import 'data/repositories/games_repository.dart' as _i4;
import 'data/repositories/local_data_repository.dart' as _i7;
import 'data/repositories/location_repository.dart' as _i11;
import 'data/services/api_service.dart' as _i9;
import 'injectable.dart' as _i15;
import 'presentation/pages/auth/cubit/auth_page_cubit.dart' as _i13;
import 'presentation/pages/home/cubit/home_page_cubit.dart' as _i5;
import 'presentation/pages/location/cubit/location_page_cubit.dart' as _i14;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioProvider = _$DioProvider();
    final injectableModule = _$InjectableModule();
    gh.singleton<_i3.Dio>(dioProvider.dio());
    gh.lazySingleton<_i4.GamesRepository>(() => _i4.GamesRepository());
    gh.factoryParam<_i5.HomePageCubit, _i6.City, dynamic>((
      city,
      _,
    ) =>
        _i5.HomePageCubit(
          gh<_i4.GamesRepository>(),
          city,
        ));
    gh.lazySingleton<_i7.LocalDataRepository>(() => _i7.LocalDataRepository());
    await gh.factoryAsync<_i8.SharedPreferences>(
      () => injectableModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i9.ApiService>(() => _i9.ApiService(gh<_i3.Dio>()));
    gh.lazySingleton<_i10.AuthRepository>(
        () => _i10.AuthRepository(gh<_i7.LocalDataRepository>()));
    gh.lazySingleton<_i11.LocationRepository>(
        () => _i11.LocationRepository(gh<_i9.ApiService>()));
    gh.singleton<_i12.AuthCubit>(_i12.AuthCubit(gh<_i10.AuthRepository>()));
    gh.lazySingleton<_i13.AuthPageCubit>(() => _i13.AuthPageCubit(
          gh<_i10.AuthRepository>(),
          gh<_i12.AuthCubit>(),
        ));
    gh.lazySingleton<_i14.LocationPageCubit>(
        () => _i14.LocationPageCubit(gh<_i11.LocationRepository>()));
    return this;
  }
}

class _$DioProvider extends _i15.DioProvider {}

class _$InjectableModule extends _i15.InjectableModule {}
