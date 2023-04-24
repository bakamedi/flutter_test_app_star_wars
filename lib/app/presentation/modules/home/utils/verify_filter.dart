import 'package:flutter_app_test_star_wars/app/presentation/modules/home/controller/home_provider.dart';
import 'package:flutter_meedu/ui.dart';

void verifyFilter() {
  final homeController = homeProvider.read;
  if (homeController.applyFilter) {
    return;
  } else {
    homeController.clearFilters();
  }
  router.pop();
}
