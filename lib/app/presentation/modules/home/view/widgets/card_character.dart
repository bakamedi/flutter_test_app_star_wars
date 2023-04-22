import 'package:flutter/material.dart';

import '../../../../../core/responsive.dart';
import '../../../../../core/widget_state.dart';
import '../../../../../domain/responses/character_response.dart';
import '../../controller/home_controller.dart';
import '../../utils/get_films.dart';
import 'filter_characters.dart';

class CardCharacter extends StatelessWidget {
  final HomeController homeController;
  final Result character;
  const CardCharacter({
    super.key,
    required this.character,
    required this.homeController,
  });

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Card(
      elevation: 3,
      color: homeController.state.widgetState == WidgetState.openFilmsLoading
          ? const Color.fromARGB(235, 247, 247, 244)
          : Colors.white,
      borderOnForeground: false,
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: responsive.hp(1),
          bottom: responsive.hp(1),
          left: responsive.wp(1.5),
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
          ),
          child: IgnorePointer(
            ignoring: homeController.state.widgetState ==
                WidgetState.openFilmsLoading,
            child: ExpansionTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    character.name,
                    style: TextStyle(
                      fontSize: responsive.dp(1.6),
                    ),
                  ),
                  Text(
                    character.gender.name,
                    style: TextStyle(
                      fontSize: responsive.dp(1.5),
                    ),
                  ),
                ],
              ),
              children: [
                homeController.state.widgetState ==
                            WidgetState.openFilmsLoading &&
                        character.films.isEmpty
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: responsive.hp(1),
                        ),
                        child: const CircularProgressIndicator(),
                      )
                    : FilterCharacters(
                        films: character.films,
                      ),
              ],
              onExpansionChanged: (value) => getFilms(
                openFilms: value,
                filmsUrl: character.filmsUrl,
                url: character.url,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
