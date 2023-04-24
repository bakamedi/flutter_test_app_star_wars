import 'package:flutter_meedu/meedu.dart';
import 'home_controller.dart';
import 'home_state.dart';

final homeProvider = StateProvider<HomeController, HomeState>(
  (_) => HomeController(),
  autoDispose: false,
);
