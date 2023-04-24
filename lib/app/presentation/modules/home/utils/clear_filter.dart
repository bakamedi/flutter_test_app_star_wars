import 'package:flutter_meedu/ui.dart';

import '../controller/home_provider.dart';

void clearFilter() {
  final homeController = homeProvider.read;
  homeController.load(1, retry: true);
  router.pop();
}
