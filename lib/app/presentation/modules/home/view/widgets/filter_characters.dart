import 'package:flutter/material.dart';

class FilterCharacters extends StatelessWidget {
  final List<String> films;
  const FilterCharacters({
    super.key,
    required this.films,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.0,
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: films.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          return FittedBox(
            child: Text(
              films[index],
            ),
          );
        },
      ),
    );
  }
}
