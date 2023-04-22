import '../../core/typedefs.dart';

abstract class StarWarsRepository {
  Future<GenericResponse> getCharacters({
    required int page,
  });

  Future<GenericResponse> getFilms({
    required String url,
  });
}
