import 'package:flutter/material.dart';

import '../../../../../core/responsive.dart';
import '../../../../../core/widget_state.dart';
import '../../controller/home_controller.dart';

class BottomLoading extends StatelessWidget {
  final HomeController homeController;
  const BottomLoading({
    super.key,
    required this.homeController,
  });

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return homeController.state.widgetState == WidgetState.fetching
        ? SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: responsive.dp(2),
              ),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          )
        : const SliverToBoxAdapter();
  }
}
