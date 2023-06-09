import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/inject.dart';
import '../../../../core/typedefs.dart';
import '../../../../core/widget_state.dart';
import '../../../../data/helpers/http_helper_response.dart';
import '../../../../domain/repositories/device_repository.dart';
import '../../../../domain/repositories/star_wars_repository.dart';
import '../../../../domain/responses/character_response.dart';
import '../../../../domain/responses/film_response.dart';
import 'home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  final ScrollController _scrollController = ScrollController();

  final StarWarsRepository _starWars = Repositories.starWarsRepo;
  final DevicePermissionRepository _devicePermission =
      Repositories.devicePermissionRepo;

  ScrollController get scrollController => _scrollController;

  List<bool> get filters => state.filters;

  bool get applyFilter => state.applyFilter;

  List<Result> get charactersFilters => state.charactersFilters;

  bool get maleFilterSelected => state.filters[0];
  bool get femaleFilterSelected => state.filters[1];
  bool get unknowmFilterSelected => state.filters[2];

  HomeController() : super(HomeState.initialState);

  void clearFilters() {
    List<bool> copyFilters = [...filters];
    for (var i = 0; i < copyFilters.length; i++) {
      copyFilters[i] = false;
    }
    state = state.copyWith(
      filters: [...copyFilters],
    );
  }

  Future<void> load(
    int page, {
    bool retry = false,
  }) async {
    //clearFilters();
    _devicePermission.requestPermission(
      permission: Permission.sensors,
    );
    if (retry) {
      onlyUpdate(
        state = state.copyWith(
          total: 0,
          page: 1,
          filters: [false, false, false],
          applyFilter: false,
          charactersFilters: [],
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

  void selectedFilter(
    int index,
    bool selected,
  ) {
    List<bool> copyFilters = [...filters];
    copyFilters[index] = !copyFilters[index];
    state = state.copyWith(
      applyFilter: copyFilters[0] || copyFilters[1] || copyFilters[2],
      filters: [...copyFilters],
    );
  }

  void applyFilters() {
    List<Result> resultCopy = state.characters;
    late List<Result> resultFilter;
    if (filters[0] && !filters[1] && !filters[2]) {
      resultFilter = resultCopy
          .where(
            (element) => element.gender == Gender.MALE,
          )
          .toList();
    } else if (filters[1] && !filters[0] && !filters[2]) {
      resultFilter = resultCopy
          .where(
            (element) => element.gender == Gender.FEMALE,
          )
          .toList();
    } else if (filters[2] && !filters[0] && !filters[1]) {
      resultFilter = resultCopy
          .where(
            (element) =>
                element.gender == Gender.NA ||
                element.gender == Gender.HERMAPHRODITE ||
                element.gender == Gender.NONE ||
                element.gender == Gender.UNKNOWN,
          )
          .toList();
    } else if (filters[0] && filters[1]) {
      resultFilter = resultCopy
          .where(
            (element) =>
                element.gender == Gender.MALE ||
                element.gender == Gender.FEMALE,
          )
          .toList();
    } else if (filters[0] && filters[2]) {
      resultFilter = resultCopy
          .where(
            (element) =>
                element.gender == Gender.MALE ||
                element.gender == Gender.NA ||
                element.gender == Gender.HERMAPHRODITE ||
                element.gender == Gender.NONE ||
                element.gender == Gender.UNKNOWN,
          )
          .toList();
    } else if (filters[1] && filters[2]) {
      resultFilter = resultCopy
          .where(
            (element) =>
                element.gender == Gender.FEMALE ||
                element.gender == Gender.NA ||
                element.gender == Gender.HERMAPHRODITE ||
                element.gender == Gender.NONE ||
                element.gender == Gender.UNKNOWN,
          )
          .toList();
    } else {
      resultFilter = resultCopy
          .where(
            (element) =>
                element.gender == Gender.MALE ||
                element.gender == Gender.FEMALE ||
                element.gender == Gender.NA ||
                element.gender == Gender.HERMAPHRODITE ||
                element.gender == Gender.NONE ||
                element.gender == Gender.UNKNOWN,
          )
          .toList();
    }
    state = state.copyWith(
      applyFilter: true,
      charactersFilters: resultFilter,
    );
  }

  void changeApplyFilter(bool apply) {
    state = state.copyWith(
      applyFilter: apply,
    );
  }
}
