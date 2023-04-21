import 'package:flutter_app_test_star_wars/app/data/helpers/http_helper_response.dart';
import 'package:flutter_meedu/meedu.dart';

import '../../../../core/inject.dart';
import '../../../../domain/repositories/star_wars_repository.dart';
import '../../../../domain/responses/character_response.dart';
import 'home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  final StarWarsRepository _starWars = Repositories.starWarsRepo;

  HomeController() : super(HomeState.initialState);

  Future<void> load() async {
    if (state is! Loaded) {
      state = const Loading();
      final starWars = await _starWars.getCharacters(page: 1);
      if (starWars.item1 == HttpHelperResponse.ok) {
        final Character character = starWars.item2;

        onlyUpdate(
          state = Loaded(
            characters: character.results,
          ),
        );
      } else {
        state = const Error();
      }
    }
  }
}
