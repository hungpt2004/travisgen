import 'package:travisgen_client/common/constant/messages.dart';

sealed class AppException implements Exception {
  String payload() {
    return '';
  }
}

class ApiException implements AppException {
  final String? identifier;

  ApiException(this.identifier);

  @override
  String payload() {
    return identifier ?? '';
  }

  @override
  String toString() {
    return identifier ?? Messages.unknownError;
  }
}

class ApiExceptionConnectivity extends ApiException {
  ApiExceptionConnectivity(super.identifier);

  @override
  String toString() {
    return Messages.networkConnectivity;
  }
}

class ApiExceptionUnauthorized extends ApiException {
  ApiExceptionUnauthorized(super.identifier);

  @override
  String toString() {
    return Messages.unauthorized;
  }
}

class ApiExceptionSocket extends ApiException {
  ApiExceptionSocket(super.identifier);

  @override
  String toString() {
    return Messages.socketError;
  }
}

class ServerException extends ApiException {
  final String message;
  ServerException(super.identifier, this.message);

  @override
  String toString() {
    return message.isNotEmpty ? message : Messages.serverError;
  }
}

class AppExceptionMalformed extends AppException {
  AppExceptionMalformed();

  @override
  String toString() {
    return Messages.malformed;
  }
}

class AppExceptionError extends AppException {
  final String message;
  AppExceptionError(this.message);

  @override
  String toString() {
    return message;
  }
}

class JsonParsingException extends AppException {
  final dynamic json;

  JsonParsingException(this.json);

  @override
  String toString() {
    return 'JsonParsingException: \nJSON: $json';
  }
}
