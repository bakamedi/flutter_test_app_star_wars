import 'package:flutter/material.dart';

import '../../../../../core/responsive.dart';
import '../../../../../core/widget_state.dart';
import '../../../../../domain/responses/character_response.dart';
import '../../controller/home_controller.dart';
import '../../utils/bottom_scroll_action.dart';
import 'bottom_loading.dart';
import 'card_character.dart';

class LoadedHome extends StatelessWidget {
  final List<Result> characters;
  final List<Result> charactersFilters;
  final WidgetState widgetState;
  final HomeController homeController;
  const LoadedHome({
    super.key,
    required this.characters,
    required this.homeController,
    required this.charactersFilters,
    required this.widgetState,
  });

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return NotificationListener(
      onNotification: bottomScrollAction,
      child: CustomScrollView(
        controller: homeController.scrollController,
        slivers: [
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
                      child: charactersFilters.isEmpty
                          ? CardCharacter(
                              character: characters[index],
                              homeController: homeController,
                              widgetState: widgetState,
                            )
                          : CardCharacter(
                              character: charactersFilters[index],
                              homeController: homeController,
                              widgetState: widgetState,
                            ),
                    ),
                  ],
                );
              },
              childCount: charactersFilters.isEmpty
                  ? characters.length
                  : charactersFilters.length,
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
