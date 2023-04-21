import '../../../core/typedefs.dart';
import '../../../domain/responses/character_response.dart';
import '../../helpers/http_handling_error.dart';
import '../../helpers/http_helper.dart';
import '../../helpers/http_helper_response.dart';

class StarWarsApi {
  final HttpHelper _http;

  StarWarsApi(this._http);

  Future<GenericResponse> getCharacter({
    required int page,
  }) async {
    final result = await _http.request(
      '/people/?page=$page',
      parser: (data) {
        return Character.fromJson(data);
      },
    );
    if (result.error == null) {
      return GenericResponse(
        HttpHelperResponse.ok,
        result.data,
      );
    } else {
      return httpHandlingError(result);
    }
  }
}
