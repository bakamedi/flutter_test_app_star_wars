import 'package:flutter/material.dart';

import '../../../core/responsive.dart';

/// Boton Rojo si existe un icono ese los reemplaza con el otro
/// boton y se le tiene que dar un tamaño porque el defecto es
/// de 15 y deberia de tomar un tamaño correspondiente al de la pantall
class PrimaryButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final double? iconSize;
  final double horizontalSpace;
  final void Function()? onPressed;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.iconSize,
    this.icon,
    this.horizontalSpace = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    double fontSize = responsive.dp(1.7);
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalSpace,
      ),
      width: double.infinity,
      child: icon == null ? _btn(fontSize) : _iconBtn(icon, fontSize),
    );
  }

  Widget _btn(double fontSize) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }

  Widget _iconBtn(IconData? icon, double fontSize) {
    return ElevatedButton.icon(
      icon: Icon(
        icon,
        size: fontSize,
      ),
      onPressed: onPressed,
      label: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
