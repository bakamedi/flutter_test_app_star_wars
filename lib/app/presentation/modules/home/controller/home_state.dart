import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/widget_state.dart';
import '../../../../domain/responses/character_response.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  // ignore: unused_element
  const HomeState._();

  const factory HomeState({
    @Default(WidgetState.initialized) WidgetState widgetState,
    @Default([]) List<Result> characters,
    @Default(1) int page,
    @Default(0) int total,
  }) = _HomeState;

  static HomeState get initialState => const HomeState();
}
