import 'package:flutter_app_test_star_wars/app/data/data_source/remote/star_wars_api.dart';
import 'package:flutter_app_test_star_wars/app/data/repositories_impl/star_wars_repository_impl.dart';
import 'package:flutter_app_test_star_wars/app/domain/repositories/star_wars_repository.dart';
import 'package:flutter_meedu/meedu.dart';

import '../data/helpers/http_helper.dart';

/// Inyeccion de dependencias para inicializar los objetos y dependecias externas
Future<void> injectDependecies() async {
  final httpHelper = HttpHelper(baseUrl: 'https://swapi.dev/api');

  Get.lazyPut<StarWarsRepository>(
    () => StarWarsRepositoryImpl(
      StarWarsApi(
        httpHelper,
      ),
    ),
  );
}

class Repositories {
  Repositories._();

  static StarWarsRepository get starWarsRepo => Get.find();
}
