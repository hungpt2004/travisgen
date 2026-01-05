// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;
import 'package:travisgen_client/common/utils/socket/ws_client.dart' as _i161;
import 'package:travisgen_client/di/modules/local_module.dart' as _i946;
import 'package:travisgen_client/di/modules/network_module.dart' as _i790;
import 'package:travisgen_client/di/providers/proxy_dio_provider.dart' as _i386;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i174.GetIt> initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final localModule = _$LocalModule();
  final networkModule = _$NetworkModule();
  gh.singleton<_i946.AuthStatusStream>(() => localModule.authStream);
  await gh.singletonAsync<_i979.Box<dynamic>>(
    () => localModule.getAuthBox(),
    instanceName: 'auth_box',
    preResolve: true,
  );
  gh.lazySingleton<_i161.WsClient>(
    () => _i161.WsClient(gh<_i979.Box<dynamic>>(instanceName: 'auth_box')),
  );
  gh.lazySingleton<_i386.DioProvider>(
    () => _i386.DioProvider(gh<_i979.Box<dynamic>>(instanceName: 'auth_box')),
  );
  gh.lazySingleton<_i361.Dio>(
    () => networkModule.provideDio(gh<_i386.DioProvider>()),
  );
  return getIt;
}

class _$LocalModule extends _i946.LocalModule {}

class _$NetworkModule extends _i790.NetworkModule {}
