import 'package:dio/dio.dart';

import 'http_method.dart';

/// Envia la peticion web al servidor/intellect
/// los opcionales son:
/// [method] por defecto es el metodo [HttpMethod.get]
/// [headers] son opcionales si se desea agregar otra caracteristica
/// [queryParams] parametros en la url
/// [parser] callback que devuele el [json_data]
/// [savePath] solo sirve para guardar los documentos de url
/// [timeOut] es el tiempo de respuesta de para las peticiones
Future<Response> sendRequest({
  required String url,
  required HttpMethod method,
  required Map<String, String> headers,
  Map<String, dynamic> queryParams = const {},
  required dynamic bodyData,
  required Duration timeOut,
}) {
  var finalHeaders = {...headers};
  if (method != HttpMethod.get) {
    final contentType = headers["Content-Type"];
    if (contentType == null || contentType.contains("application/json")) {
      finalHeaders["Content-Type"] = "application/json; charset=UTF-8";
      bodyData = bodyData;
    }
  }

  final client = Dio();
  client.options.headers = finalHeaders;

  if (queryParams.isNotEmpty) {
    client.options.queryParameters.addAll(queryParams);
  }

  switch (method) {
    case HttpMethod.get:
      return client
          .get(
            url,
          )
          .timeout(timeOut);
    case HttpMethod.post:
      return client
          .post(
            url,
            data: bodyData,
          )
          .timeout(timeOut);
    case HttpMethod.put:
      return client
          .put(
            url,
            data: bodyData,
          )
          .timeout(timeOut);
    case HttpMethod.path:
      return client
          .patch(
            url,
            data: bodyData,
          )
          .timeout(timeOut);
    case HttpMethod.delete:
      return client
          .delete(
            url,
            data: bodyData,
          )
          .timeout(timeOut);
  }
}
