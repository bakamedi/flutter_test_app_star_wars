import 'package:flutter/material.dart';
import 'package:flutter_app_test_star_wars/app/core/widget_state.dart';
import 'package:flutter_app_test_star_wars/app/presentation/modules/home/controller/home_controller.dart';

import '../../../../../core/responsive.dart';
import '../../../../../domain/responses/character_response.dart';
import 'filter_characters.dart';

class LoadedHome extends StatelessWidget {
  final List<Result> characters;
  final HomeController homeController;
  const LoadedHome({
    super.key,
    required this.characters,
    required this.homeController,
  });

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return NotificationListener(
      onNotification: (notification) {
        final position = homeController.scrollController.position;
        if (notification is ScrollEndNotification) {
          final offset = position.pixels;
          final maxScrollExtent = position.maxScrollExtent;
          if (offset >= maxScrollExtent) {
            homeController.load(
              homeController.state.page + 1,
              retry: true,
            );
          }
        }
        return true;
      },
      child: CustomScrollView(
        controller: homeController.scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: Placeholder(
              fallbackHeight: responsive.hp(10),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Column(
                  children: [
                    Container(
                      width: responsive.width,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(
                              top: responsive.hp(1),
                              bottom: responsive.hp(1),
                              left: responsive.wp(1.5)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(characters[index].name),
                              Text(characters[index].gender.name),
                              FilterCharacters(
                                films: characters[index].films,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              childCount: characters.length,
            ),
          ),
          homeController.state.widgetState == WidgetState.fetching
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
              : const SliverToBoxAdapter(),
        ],
      ),
    );
  }
}
