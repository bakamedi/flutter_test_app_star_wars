import 'dart:async';

import 'package:flutter_meedu/meedu.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorController extends SimpleNotifier {
  double _x = 0.0;
  double _y = 0.0;

  double get x => _x;
  double get y => _y;

  // suscripción a los sensores del giroscopio
  late StreamSubscription _gyroscope;

  void initGyro() {
    _gyroscope = gyroscopeEvents.listen((GyroscopeEvent event) {
      _x = event.x;
      _y = event.y;
      notify();
    });
  }

  void _disposeGyro() {
    _gyroscope.cancel();
  }

  @override
  void dispose() {
    _disposeGyro();
    super.dispose();
  }
}

final sensorProvider = SimpleProvider(
  (_) => SensorController(),
);
