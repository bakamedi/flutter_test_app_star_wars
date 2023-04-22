import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

import '../../../global/widgets/state_widget.dart';
import '../controller/home_controller.dart';
import '../controller/home_provider.dart';
import 'widgets/loaded_home.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<HomeController>(
      provider: homeProvider,
      onInitState: (_, controller) => controller.load(1),
      builder: (_, controller) {
        return Scaffold(
          body: Consumer(
            builder: (_, ref, __) {
              final homeController = ref.watch(homeProvider);
              final state = homeController.state;
              final widgetState = state.widgetState;
              return StateWidget(
                widgetState: widgetState,
                child: LoadedHome(
                  characters: state.characters,
                  homeController: homeController,
                ),
                onPressed: () {},
              );
            },
          ),
        );
      },
    );
  }
}
