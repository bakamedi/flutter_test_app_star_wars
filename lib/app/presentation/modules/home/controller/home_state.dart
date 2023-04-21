import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/responses/character_response.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  // ignore: unused_element
  const HomeState._();

  /// unions
  const factory HomeState.loading() = Loading;
  const factory HomeState.loaded({
    required List<Result> characters,
  }) = Loaded;
  const factory HomeState.error() = Error;

  static HomeState get initialState => const Loading();
}
