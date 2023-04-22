import 'package:flutter/material.dart';

import '../../../../../core/responsive.dart';
import '../../../../../domain/responses/film_response.dart';

class FilterCharacters extends StatelessWidget {
  final List<Film> films;
  const FilterCharacters({
    super.key,
    required this.films,
  });

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return SizedBox(
      height: responsive.hp(4),
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: films.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
              vertical: responsive.hp(0.5),
              horizontal: responsive.wp(1),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: responsive.wp(1.5),
            ),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Text(
              films[index].title,
              style: TextStyle(
                color: Colors.white,
                fontSize: responsive.dp(1.4),
              ),
            ),
          );
        },
      ),
    );
  }
}
