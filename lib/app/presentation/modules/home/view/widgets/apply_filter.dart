import 'package:flutter_app_test_star_wars/app/presentation/modules/home/utils/verify_filter.dart';
import 'package:flutter_meedu/ui.dart';

import '../../controller/home_provider.dart';

void applyFilter() {
  verifyFilter();
  final homeController = homeProvider.read;
  homeController.applyFilters();
  router.pop();
}
