import 'package:flutter/material.dart';

import '../../../core/widget_state.dart';
import 'internet_widget.dart/internet_widget.dart';

class StateWidget extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final WidgetState widgetState;
  const StateWidget({
    super.key,
    required this.child,
    this.onPressed,
    required this.widgetState,
  });

  @override
  Widget build(BuildContext context) {
    if (widgetState == WidgetState.initialized) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (widgetState == WidgetState.internet) {
      return InternetWidget(
        onPressed: () => onPressed,
      );
    } else {
      return child;
    }
  }
}
