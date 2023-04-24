import 'dart:io';

import 'package:tuple/tuple.dart';

import 'http_helper_response.dart';
import 'http_result.dart';

/// Maneja los errores mas comunes de las peticiones HTTP
/// recibe el resultado como [result]
Tuple2<HttpHelperResponse, dynamic> httpHandlingError(
  HttpResult<dynamic> result, {
  dynamic valueBadRequest,
  dynamic valueInternalServerError,
}) {
  if (result.statusCode == HttpStatus.badRequest) {
    return Tuple2(
      HttpHelperResponse.invalidGrant,
      valueBadRequest,
    );
  }

  if (result.statusCode == HttpStatus.notFound) {
    return const Tuple2(
      HttpHelperResponse.notFound,
      null,
    );
  }

  if (result.statusCode == HttpStatus.networkConnectTimeoutError) {
    return const Tuple2(
      HttpHelperResponse.socketTimeout,
      null,
    );
  }

  if (result.statusCode == HttpStatus.gatewayTimeout) {
    return const Tuple2(
      HttpHelperResponse.socketException,
      null,
    );
  }

  if (result.statusCode == HttpStatus.serviceUnavailable) {
    return const Tuple2(
      HttpHelperResponse.serviceUnavailable,
      null,
    );
  }

  if (result.statusCode == -2) {
    return const Tuple2(HttpHelperResponse.noInternetConnection, null);
  }

  if (result.statusCode == HttpStatus.networkConnectTimeoutError) {
    return const Tuple2(HttpHelperResponse.socketTimeout, null);
  }

  if (result.statusCode == HttpStatus.gatewayTimeout) {
    return const Tuple2(
      HttpHelperResponse.socketException,
      null,
    );
  }
  return const Tuple2(
    HttpHelperResponse.unknownError,
    null,
  );
}
