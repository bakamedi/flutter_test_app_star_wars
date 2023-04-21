import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

import '../controller/home_controller.dart';
import '../controller/home_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<HomeController>(
      provider: homeProvider,
      onAfterFirstLayout: (_, controller) => controller.load(),
      builder: (_, controller) {
        return Scaffold(
          body: Center(
            child: Consumer(
              builder: (_, ref, __) {
                final state = ref.watch(homeProvider).state;
                return state.when(
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  loaded: (characters) => ListView.builder(
                    itemBuilder: (_, index) => ListTile(
                      title: Text(characters[index].name),
                      subtitle: Text('${characters[index].films.length}'),
                    ),
                    itemCount: characters.length,
                  ),
                  error: () => const Center(
                    child: Text("Error"),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
