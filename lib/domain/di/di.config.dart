// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/api_manager.dart' as _i236;
import '../../data/data_source/remote_data_source/auth_remote_data_source.dart'
    as _i650;
import '../../data/data_source/remote_data_source/auth_remote_data_source_impl.dart'
    as _i191;
import '../../data/repository/auth_repository_impl.dart' as _i581;
import '../../features/register_login/login/cubit/login_cubit.dart' as _i805;
import '../../features/register_login/register/cubit/register_cubit.dart'
    as _i888;
import '../repository/register_repo.dart' as _i361;
import '../use_case/register_use_case.dart' as _i204;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i236.ApiManager>(() => _i236.ApiManager());
    gh.factory<_i650.AuthRemoteDataSource>(() =>
        _i191.AuthRemoteDataSourceImpl(apiManager: gh<_i236.ApiManager>()));
    gh.factory<_i361.AuthRepository>(() => _i581.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i650.AuthRemoteDataSource>()));
    gh.factory<_i204.RegisterUseCase>(() =>
        _i204.RegisterUseCase(authRepository: gh<_i361.AuthRepository>()));
    gh.factory<_i805.LoginViewModel>(() =>
        _i805.LoginViewModel(registerUseCase: gh<_i204.RegisterUseCase>()));
    gh.factory<_i888.RegisterViewModel>(() =>
        _i888.RegisterViewModel(registerUseCase: gh<_i204.RegisterUseCase>()));
    return this;
  }
}
