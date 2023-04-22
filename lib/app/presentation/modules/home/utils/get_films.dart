import 'package:flutter_app_test_star_wars/app/core/widget_state.dart';

import '../controller/home_controller.dart';
import '../controller/home_provider.dart';

void getFilms({
  required bool openFilms,
  required List<String> filmsUrl,
  required String url,
}) async {
  final HomeController homeController = homeProvider.read;
  homeController.changeWidgetState(
    WidgetState.openFilmsLoading,
  );
  await homeController.getFilms(
    openFilms,
    filmsUrl,
    url,
  );
  homeController.changeWidgetState(
    WidgetState.closeFilmsLoading,
  );
}
