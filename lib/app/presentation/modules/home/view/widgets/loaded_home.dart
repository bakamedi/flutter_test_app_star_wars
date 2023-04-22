import 'package:flutter/material.dart';

import '../../../../../core/responsive.dart';
import '../../../../../domain/responses/character_response.dart';
import '../../controller/home_controller.dart';
import 'bottom_loading.dart';
import 'card_character.dart';

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
                      margin: EdgeInsets.symmetric(
                        horizontal: responsive.wp(2),
                        vertical: responsive.hp(1),
                      ),
                      child: CardCharacter(
                        character: characters[index],
                        homeController: homeController,
                      ),
                    ),
                  ],
                );
              },
              childCount: characters.length,
            ),
          ),
          BottomLoading(
            homeController: homeController,
          ),
        ],
      ),
    );
  }
}
