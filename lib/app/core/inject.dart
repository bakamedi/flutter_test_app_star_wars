import 'package:flutter_meedu/meedu.dart';

import '../data/data_source/remote/star_wars_api.dart';
import '../data/helpers/http_helper.dart';
import '../data/repositories_impl/device_repository_impl.dart';
import '../data/repositories_impl/star_wars_repository_impl.dart';
import '../domain/repositories/device_repository.dart';
import '../domain/repositories/star_wars_repository.dart';

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

  Get.lazyPut<DevicePermissionRepository>(
    () => DevicePermissionRepositoryImpl(),
  );
}

class Repositories {
  Repositories._();

  static StarWarsRepository get starWarsRepo => Get.find();
  static DevicePermissionRepository get devicePermissionRepo => Get.find();
}
