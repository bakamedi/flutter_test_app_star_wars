import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:sensors_plus/sensors_plus.dart';

class SensorController extends SimpleNotifier {
  double _x = 0.0;
  double _y = 0.0;
  double _z = 0.0;

  double get x => _x;
  double get y => _y;
  double get z => _z;

  // suscripción a los sensores del giroscopio
  late StreamSubscription _gyroscope;

  void initGyro() {
    _gyroscope = gyroscopeEvents.listen((GyroscopeEvent event) {
      _x = event.x;
      _y = event.y;
      _z = event.z;
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

  Matrix4 pmat(num pv) {
    return Matrix4(
      1.0, 0.0, 0.0, 0.0, //
      0.0, 1.0, 0.0, 0.0, //
      0.0, 0.0, 1.0, pv * 0.001, //
      0.0, 0.0, 0.0, 1.0,
    );
  }

  Matrix4 get perspective => pmat(1.0);
}

final sensorProvider = SimpleProvider(
  (_) => SensorController(),
);
