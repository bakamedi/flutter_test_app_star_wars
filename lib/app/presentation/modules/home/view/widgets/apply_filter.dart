import 'package:flutter_meedu/ui.dart';

import '../../controller/home_provider.dart';

void applyFilter() {
  final homeController = homeProvider.read;
  homeController.applyFilters();
  router.pop();
}
