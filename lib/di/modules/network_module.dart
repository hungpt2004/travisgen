import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:travisgen_client/di/providers/proxy_dio_provider.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio provideDio(DioProvider dioProvider) {
    return dioProvider.getDio();
  }
}
