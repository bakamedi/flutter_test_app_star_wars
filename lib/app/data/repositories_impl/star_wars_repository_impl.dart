import 'package:flutter_app_test_star_wars/app/core/typedefs.dart';
import 'package:flutter_app_test_star_wars/app/data/data_source/remote/star_wars_api.dart';

import '../../domain/repositories/star_wars_repository.dart';

class StarWarsRepositoryImpl implements StarWarsRepository {
  final StarWarsApi _starWarsApi;

  StarWarsRepositoryImpl(this._starWarsApi);

  @override
  Future<GenericResponse> getCharacters({required int page}) async {
    return await _starWarsApi.getCharacter(page: page);
  }
}
