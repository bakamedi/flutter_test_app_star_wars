import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/inject.dart';
import '../../../../core/typedefs.dart';
import '../../../../core/widget_state.dart';
import '../../../../data/helpers/http_helper_response.dart';
import '../../../../domain/repositories/star_wars_repository.dart';
import '../../../../domain/responses/character_response.dart';
import '../../../../domain/responses/film_response.dart';
import '../../../global/controllers/device_permission_controller.dart';
import 'home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  final DevicePermissionController _devicePermissionController;

  final ScrollController _scrollController = ScrollController();

  final StarWarsRepository _starWars = Repositories.starWarsRepo;

  ScrollController get scrollController => _scrollController;

  HomeController(
    this._devicePermissionController,
  ) : super(HomeState.initialState);

  Future<void> load(
    int page, {
    bool retry = false,
  }) async {
    _devicePermissionController.requestPermission(
      permission: Permission.sensors,
    );
    if (retry) {
      onlyUpdate(
        state = state.copyWith(
          total: 0,
          page: 1,
        ),
      );
    }

    if (state.page > 1 && state.total < state.page) {
      return;
    }
    if (state.widgetState == WidgetState.fetching) {
      return;
    }

    onlyUpdate(
      state = state.copyWith(
        widgetState: WidgetState.fetching,
      ),
    );

    final starWars = await _starWars.getCharacters(
      page: page,
    );
    if (starWars.item1 == HttpHelperResponse.ok) {
      final prevCharacters = List<Result>.from(
        state.characters,
      );

      final Character character = starWars.item2;

      final List<Result> characters = character.results;

      onlyUpdate(
        state = state.copyWith(
          widgetState: WidgetState.ok,
          characters: [
            ...prevCharacters,
            ...characters,
          ],
          page: page,
          total: character.count,
        ),
      );
    } else {
      onlyUpdate(
        state = state.copyWith(
          characters: [],
          total: 0,
          widgetState: WidgetState.error,
          page: 1,
        ),
      );
    }
  }

  Future<void> getFilms(
    bool openFilms,
    List<String> filmsUrl,
    String url,
  ) async {
    List<Film> films = [];
    final character = state.characters.firstWhere(
      (element) => element.url == url,
    );
    character.openFilms = openFilms;
    if (openFilms) {
      for (int i = 0; i < filmsUrl.length; i++) {
        final GenericResponse genericResponse = await _starWars.getFilms(
          url: filmsUrl[i],
        );
        if (genericResponse.item1 == HttpHelperResponse.ok) {
          final Film film = genericResponse.item2;
          films.add(film);
        }
      }
      character.films = films;
    }
  }

  void changeWidgetState(WidgetState widgetState) {
    onlyUpdate(
      state = state.copyWith(
        widgetState: widgetState,
      ),
    );
  }
}
