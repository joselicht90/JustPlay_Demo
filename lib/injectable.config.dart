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
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import 'data/global_blocs/auth_cubit.dart' as _i9;
import 'data/repositories/auth_repository.dart' as _i7;
import 'data/repositories/local_data_repository.dart' as _i4;
import 'data/repositories/location_repository.dart' as _i8;
import 'data/services/api_service.dart' as _i6;
import 'injectable.dart' as _i12;
import 'presentation/pages/auth/cubit/auth_page_cubit.dart' as _i10;
import 'presentation/pages/location/cubit/location_page_cubit.dart' as _i11;

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
    gh.lazySingleton<_i4.LocalDataRepository>(() => _i4.LocalDataRepository());
    await gh.factoryAsync<_i5.SharedPreferences>(
      () => injectableModule.sharedPreferences,
      preResolve: true,
    );
    gh.factory<_i6.ApiService>(() => _i6.ApiService(gh<_i3.Dio>()));
    gh.lazySingleton<_i7.AuthRepository>(
        () => _i7.AuthRepository(gh<_i4.LocalDataRepository>()));
    gh.lazySingleton<_i8.LocationRepository>(
        () => _i8.LocationRepository(gh<_i6.ApiService>()));
    gh.singleton<_i9.AuthCubit>(_i9.AuthCubit(gh<_i7.AuthRepository>()));
    gh.lazySingleton<_i10.AuthPageCubit>(() => _i10.AuthPageCubit(
          gh<_i7.AuthRepository>(),
          gh<_i9.AuthCubit>(),
        ));
    gh.lazySingleton<_i11.LocationPageCubit>(
        () => _i11.LocationPageCubit(gh<_i8.LocationRepository>()));
    return this;
  }
}

class _$DioProvider extends _i12.DioProvider {}

class _$InjectableModule extends _i12.InjectableModule {}
