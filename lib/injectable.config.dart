// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import 'data/global_blocs/auth_cubit.dart' as _i6;
import 'data/repositories/auth_repository.dart' as _i5;
import 'data/repositories/local_data_repository.dart' as _i3;
import 'injectable.dart' as _i8;
import 'presentation/pages/auth/cubit/auth_page_cubit.dart' as _i7;

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
    final injectableModule = _$InjectableModule();
    gh.lazySingleton<_i3.LocalDataRepository>(() => _i3.LocalDataRepository());
    await gh.factoryAsync<_i4.SharedPreferences>(
      () => injectableModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i5.AuthRepository>(
        () => _i5.AuthRepository(gh<_i3.LocalDataRepository>()));
    gh.singleton<_i6.AuthCubit>(_i6.AuthCubit(gh<_i5.AuthRepository>()));
    gh.lazySingleton<_i7.AuthPageCubit>(() => _i7.AuthPageCubit(
          gh<_i5.AuthRepository>(),
          gh<_i6.AuthCubit>(),
        ));
    return this;
  }
}

class _$InjectableModule extends _i8.InjectableModule {}
