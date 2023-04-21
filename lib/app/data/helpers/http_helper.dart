import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../../core/typedefs.dart';
import 'http_method.dart';
import 'http_result.dart';
import 'internet_checker.dart';
import 'send_request.dart';

class HttpHelper {
  final String baseUrl;

  HttpHelper({this.baseUrl = ''});

  /// es requerido la ruta de la url [path] ejemplo: /login/session/
  /// los opcionales son:
  /// [method] por defecto es el metodo [HttpMethod.get]
  /// [headers] son opcionales si se desea agregar otra caracteristica
  /// [queryParams] parametros en la url
  /// [parser] callback que devuele el [json_data]
  /// [savePath] solo sirve para guardar los documentos de url
  /// [timeOut] es el tiempo de respuesta de para las peticiones
  Future<HttpResult<T>> request<T>(
    String path, {
    HttpMethod method = HttpMethod.get,
    Map<String, String> headers = const {},
    Map<String, dynamic> queryParams = const {},
    dynamic bodyData,
    Parser<T>? parser,
    String savePath = '',
    Duration timeOut = const Duration(seconds: 30),
  }) async {
    int? statusCode;
    dynamic data;
    try {
      late String url;
      if (path.startsWith("https://") || path.startsWith("http://")) {
        url = path;
      } else {
        url = '$baseUrl$path';
      }

      final hasConnection = await hasInternetConnection();
      if (hasConnection) {
        final response = await sendRequest(
          url: url,
          method: method,
          headers: headers,
          bodyData: bodyData,
          timeOut: timeOut,
          queryParams: queryParams,
        );

        data = response.data;
        statusCode = response.statusCode;

        if (statusCode! >= HttpStatus.badRequest) {
          throw HttpError(
            data: data,
            stackTrace: StackTrace.current,
            exception: null,
            dioErrorType: DioErrorType.unknown,
          );
        }
        return HttpResult<T>(
          data: parser != null ? parser(data) : data,
          statusCode: statusCode,
          error: null,
        );
      } else {
        return HttpResult<T>(
          data: data,
          statusCode: -2,
          error: HttpError(
            data: data,
            exception: null,
            stackTrace: null,
            dioErrorType: DioErrorType.unknown,
          ),
        );
      }
    } catch (e, s) {
      if (e is HttpError) {
        return HttpResult<T>(
          data: null,
          statusCode: statusCode!,
          error: e,
        );
      }

      if (e is DioError) {
        if (DioErrorType.connectionError == e.type ||
            DioErrorType.receiveTimeout == e.type) {
          return HttpResult<T>(
            data: e.response?.data,
            statusCode: e.response?.statusCode ?? -1,
            error: HttpError(
              data: e.error,
              exception: e,
              stackTrace: e.stackTrace,
              dioErrorType: e.type,
            ),
          );
        } else if (DioErrorType.sendTimeout == e.type) {
          return HttpResult<T>(
            data: e.response?.data,
            statusCode: e.response?.statusCode ?? -1,
            error: HttpError(
              data: e.error,
              exception: e,
              stackTrace: e.stackTrace,
              dioErrorType: e.type,
            ),
          );
        } else if (DioErrorType.unknown == e.type) {
          if (e.message!.contains('SocketException')) {
            return HttpResult<T>(
              data: null,
              statusCode: HttpStatus.gatewayTimeout,
              error: HttpError(
                data: e,
                exception: e,
                stackTrace: s,
                dioErrorType: DioErrorType.sendTimeout,
              ),
            );
          }
        } else if (DioErrorType.unknown == e.type) {
          if (e.message!.contains('TimeoutException')) {
            return HttpResult<T>(
              data: null,
              statusCode: HttpStatus.networkConnectTimeoutError,
              error: HttpError(
                data: e,
                exception: e,
                stackTrace: s,
                dioErrorType: DioErrorType.sendTimeout,
              ),
            );
          }
        }
        return HttpResult<T>(
          data: e.response?.data ?? null,
          statusCode: e.response?.statusCode,
          error: HttpError(
            data: e,
            exception: e,
            stackTrace: s,
            dioErrorType: DioErrorType.sendTimeout,
          ),
        );
      }

      if (e is TimeoutException) {
        return HttpResult<T>(
          data: null,
          statusCode: HttpStatus.networkConnectTimeoutError,
          error: HttpError(
            data: e,
            exception: e,
            stackTrace: s,
            dioErrorType: DioErrorType.sendTimeout,
          ),
        );
      }

      if (e is SocketException) {
        return HttpResult<T>(
          data: null,
          statusCode: HttpStatus.gatewayTimeout,
          error: HttpError(
            data: e,
            exception: e,
            stackTrace: s,
            dioErrorType: DioErrorType.sendTimeout,
          ),
        );
      }

      return HttpResult<T>(
        data: null,
        statusCode: statusCode ?? -1,
        error: HttpError(
          data: data,
          exception: e,
          stackTrace: s,
          dioErrorType: DioErrorType.unknown,
        ),
      );
    }
  }
}
