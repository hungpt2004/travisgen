import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:travisgen_client/common/constant/hive_keys.dart';

class AppInterceptor extends QueuedInterceptor {
  AppInterceptor({@Named(HiveKeys.authBox) required Box<dynamic> authBox}) : _authBox = authBox;

  final Box<dynamic> _authBox;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    log(options.headers.toString());

    log('REQUEST[${options.method}] => PATH: ${options.path}');

    final token = _authBox.get(HiveKeys.token) as String?;

    if (token != null) {
      options.headers.addAll({'Token': token, HttpHeaders.authorizationHeader: 'Bearer $token'});
    }

    final deviceToken = _authBox.get(HiveKeys.deviceToken) as String?;
    if (deviceToken != null) {
      options.headers['Identifier'] = deviceToken;
    }

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    log('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}', name: 'Interceptor: onResponse');

    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}', name: 'Interceptor: onError');

    return handler.next(err);
  }
}
