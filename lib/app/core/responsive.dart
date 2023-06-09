import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Clase de ayuda para el manejo de pantalla dinamica
class Responsive {
  late double _width, _height, _diagonal;

  double get width => _width;
  double get height => _height;
  double get diagonal => _diagonal;

  static Responsive of(BuildContext context) => Responsive(context);

  Responsive(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    _width = size.width;
    _height = size.height;

    // c2 = a2 + b2 => c =sqrt(a2 + b2)
    _diagonal = math.sqrt(
      math.pow(_width, 2) + math.pow(_height, 2),
    );
  }

  double wp(double percent) => _width * percent / 100;

  double hp(double percent) => _height * percent / 100;

  double dp(double percent) => _diagonal * percent / 100;
}
