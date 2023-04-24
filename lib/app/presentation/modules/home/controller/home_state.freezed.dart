// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  dynamic get applyFilter => throw _privateConstructorUsedError;
  List<bool> get filters => throw _privateConstructorUsedError;
  WidgetState get widgetState => throw _privateConstructorUsedError;
  List<Result> get characters => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {dynamic applyFilter,
      List<bool> filters,
      WidgetState widgetState,
      List<Result> characters,
      int page,
      int total});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applyFilter = freezed,
    Object? filters = null,
    Object? widgetState = null,
    Object? characters = null,
    Object? page = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      applyFilter: freezed == applyFilter
          ? _value.applyFilter
          : applyFilter // ignore: cast_nullable_to_non_nullable
              as dynamic,
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      widgetState: null == widgetState
          ? _value.widgetState
          : widgetState // ignore: cast_nullable_to_non_nullable
              as WidgetState,
      characters: null == characters
          ? _value.characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<Result>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic applyFilter,
      List<bool> filters,
      WidgetState widgetState,
      List<Result> characters,
      int page,
      int total});
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_HomeState>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applyFilter = freezed,
    Object? filters = null,
    Object? widgetState = null,
    Object? characters = null,
    Object? page = null,
    Object? total = null,
  }) {
    return _then(_$_HomeState(
      applyFilter: freezed == applyFilter ? _value.applyFilter! : applyFilter,
      filters: null == filters
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<bool>,
      widgetState: null == widgetState
          ? _value.widgetState
          : widgetState // ignore: cast_nullable_to_non_nullable
              as WidgetState,
      characters: null == characters
          ? _value._characters
          : characters // ignore: cast_nullable_to_non_nullable
              as List<Result>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_HomeState extends _HomeState with DiagnosticableTreeMixin {
  const _$_HomeState(
      {this.applyFilter = false,
      final List<bool> filters = const [false, false, false],
      this.widgetState = WidgetState.initialized,
      final List<Result> characters = const [],
      this.page = 1,
      this.total = 0})
      : _filters = filters,
        _characters = characters,
        super._();

  @override
  @JsonKey()
  final dynamic applyFilter;
  final List<bool> _filters;
  @override
  @JsonKey()
  List<bool> get filters {
    if (_filters is EqualUnmodifiableListView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filters);
  }

  @override
  @JsonKey()
  final WidgetState widgetState;
  final List<Result> _characters;
  @override
  @JsonKey()
  List<Result> get characters {
    if (_characters is EqualUnmodifiableListView) return _characters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_characters);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int total;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeState(applyFilter: $applyFilter, filters: $filters, widgetState: $widgetState, characters: $characters, page: $page, total: $total)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeState'))
      ..add(DiagnosticsProperty('applyFilter', applyFilter))
      ..add(DiagnosticsProperty('filters', filters))
      ..add(DiagnosticsProperty('widgetState', widgetState))
      ..add(DiagnosticsProperty('characters', characters))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('total', total));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            const DeepCollectionEquality()
                .equals(other.applyFilter, applyFilter) &&
            const DeepCollectionEquality().equals(other._filters, _filters) &&
            (identical(other.widgetState, widgetState) ||
                other.widgetState == widgetState) &&
            const DeepCollectionEquality()
                .equals(other._characters, _characters) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total, total) || other.total == total));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(applyFilter),
      const DeepCollectionEquality().hash(_filters),
      widgetState,
      const DeepCollectionEquality().hash(_characters),
      page,
      total);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState extends HomeState {
  const factory _HomeState(
      {final dynamic applyFilter,
      final List<bool> filters,
      final WidgetState widgetState,
      final List<Result> characters,
      final int page,
      final int total}) = _$_HomeState;
  const _HomeState._() : super._();

  @override
  dynamic get applyFilter;
  @override
  List<bool> get filters;
  @override
  WidgetState get widgetState;
  @override
  List<Result> get characters;
  @override
  int get page;
  @override
  int get total;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
