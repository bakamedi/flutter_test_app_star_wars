import '../../core/typedefs.dart';

abstract class StarWarsRepository {
  Future<GenericResponse> getCharacters({
    required int page,
  });
}
