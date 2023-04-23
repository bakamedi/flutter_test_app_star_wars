import 'package:flutter_meedu/meedu.dart';
import '../../../global/controllers/device_permission_controller.dart';
import 'home_controller.dart';
import 'home_state.dart';

final homeProvider = StateProvider<HomeController, HomeState>(
  (_) => HomeController(
    devicePermissionProvider.read,
  ),
  autoDispose: false,
);
