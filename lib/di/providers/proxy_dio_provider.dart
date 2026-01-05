import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:travisgen_client/common/constant/env.dart';
import 'package:travisgen_client/common/constant/hive_keys.dart';
import 'package:travisgen_client/di/interceptors/app_interceptor.dart';

@lazySingleton
class DioProvider {
  final Box<dynamic> _authBox;

  DioProvider(@Named(HiveKeys.authBox) this._authBox);

  Dio? _dio;
  Dio getDio() => _dio ?? _createDio();

  Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      ),
    );

    final appInterceptor = AppInterceptor(authBox: _authBox);

    _dio = dio
      ..options.headers = {HttpHeaders.contentTypeHeader: ContentType.json.value, 'provisioner': 'client'}
      ..options.baseUrl = Env.baseUrl
      ..interceptors.addAll([appInterceptor]);

    return dio;
  }
}
