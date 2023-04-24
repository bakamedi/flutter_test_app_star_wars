// To parse this JSON data, do
//
//     final character = characterFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'film_response.dart';

Character characterFromJson(String str) => Character.fromJson(json.decode(str));

String characterToJson(Character data) => json.encode(data.toJson());

class Character {
  Character({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  final int count;
  final String next;
  final String? previous;
  final List<Result> results;

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Result>.from(
          json["results"].map((x) => Result.fromJson(x)),
        ),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<Result>.from(
          results.map((x) => x.toJson()),
        ),
      };
}

class Result {
  Result({
    required this.name,
    required this.height,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.birthYear,
    required this.gender,
    required this.homeworld,
    required this.filmsUrl,
    required this.species,
    required this.vehicles,
    required this.starships,
    required this.created,
    required this.edited,
    required this.url,
    required this.films,
    required this.openFilms,
  });

  final String name;
  final String height;
  final String mass;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String birthYear;
  final Gender gender;
  final String homeworld;
  final List<String> filmsUrl;
  final List<String> species;
  final List<String> vehicles;
  final List<String> starships;
  final DateTime created;
  final DateTime edited;
  final String url;

  /// state for UI
  bool openFilms;
  List<Film> films;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        height: json["height"],
        mass: json["mass"],
        hairColor: json["hair_color"],
        skinColor: json["skin_color"],
        eyeColor: json["eye_color"],
        birthYear: json["birth_year"],
        gender: genderValues.map[json["gender"]]!,
        homeworld: json["homeworld"],
        filmsUrl: List<String>.from(json["films"].map((x) => x)),
        species: List<String>.from(json["species"].map((x) => x)),
        vehicles: List<String>.from(json["vehicles"].map((x) => x)),
        starships: List<String>.from(json["starships"].map((x) => x)),
        created: DateTime.parse(json["created"]),
        edited: DateTime.parse(json["edited"]),
        url: json["url"],
        films: [],
        openFilms: false,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "height": height,
        "mass": mass,
        "hair_color": hairColor,
        "skin_color": skinColor,
        "eye_color": eyeColor,
        "birth_year": birthYear,
        "gender": genderValues.reverse[gender],
        "homeworld": homeworld,
        "films": List<String>.from(films.map((x) => x)),
        "species": List<String>.from(species.map((x) => x)),
        "vehicles": List<String>.from(vehicles.map((x) => x)),
        "starships": List<String>.from(starships.map((x) => x)),
        "created": created.toIso8601String(),
        "edited": edited.toIso8601String(),
        "url": url,
      };
}

enum Gender {
  MALE,
  FEMALE,
  HERMAPHRODITE,
  UNKNOWN,
  NA,
  NONE,
}

final genderValues = EnumValues({
  "hermaphrodite": Gender.HERMAPHRODITE,
  "male": Gender.MALE,
  "female": Gender.FEMALE,
  "unknown": Gender.UNKNOWN,
  "n/a": Gender.NA,
  "none": Gender.NONE,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
