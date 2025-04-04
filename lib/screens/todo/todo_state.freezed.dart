// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodoState {

 List<TodoModel> get todos; List<Coin> get coins;
/// Create a copy of TodoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoStateCopyWith<TodoState> get copyWith => _$TodoStateCopyWithImpl<TodoState>(this as TodoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoState&&const DeepCollectionEquality().equals(other.todos, todos)&&const DeepCollectionEquality().equals(other.coins, coins));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(todos),const DeepCollectionEquality().hash(coins));

@override
String toString() {
  return 'TodoState(todos: $todos, coins: $coins)';
}


}

/// @nodoc
abstract mixin class $TodoStateCopyWith<$Res>  {
  factory $TodoStateCopyWith(TodoState value, $Res Function(TodoState) _then) = _$TodoStateCopyWithImpl;
@useResult
$Res call({
 List<TodoModel> todos, List<Coin> coins
});




}
/// @nodoc
class _$TodoStateCopyWithImpl<$Res>
    implements $TodoStateCopyWith<$Res> {
  _$TodoStateCopyWithImpl(this._self, this._then);

  final TodoState _self;
  final $Res Function(TodoState) _then;

/// Create a copy of TodoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? todos = null,Object? coins = null,}) {
  return _then(_self.copyWith(
todos: null == todos ? _self.todos : todos // ignore: cast_nullable_to_non_nullable
as List<TodoModel>,coins: null == coins ? _self.coins : coins // ignore: cast_nullable_to_non_nullable
as List<Coin>,
  ));
}

}


/// @nodoc


class _TodoState extends TodoState {
   _TodoState({required final  List<TodoModel> todos, required final  List<Coin> coins}): _todos = todos,_coins = coins,super._();
  

 final  List<TodoModel> _todos;
@override List<TodoModel> get todos {
  if (_todos is EqualUnmodifiableListView) return _todos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_todos);
}

 final  List<Coin> _coins;
@override List<Coin> get coins {
  if (_coins is EqualUnmodifiableListView) return _coins;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_coins);
}


/// Create a copy of TodoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoStateCopyWith<_TodoState> get copyWith => __$TodoStateCopyWithImpl<_TodoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodoState&&const DeepCollectionEquality().equals(other._todos, _todos)&&const DeepCollectionEquality().equals(other._coins, _coins));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_todos),const DeepCollectionEquality().hash(_coins));

@override
String toString() {
  return 'TodoState(todos: $todos, coins: $coins)';
}


}

/// @nodoc
abstract mixin class _$TodoStateCopyWith<$Res> implements $TodoStateCopyWith<$Res> {
  factory _$TodoStateCopyWith(_TodoState value, $Res Function(_TodoState) _then) = __$TodoStateCopyWithImpl;
@override @useResult
$Res call({
 List<TodoModel> todos, List<Coin> coins
});




}
/// @nodoc
class __$TodoStateCopyWithImpl<$Res>
    implements _$TodoStateCopyWith<$Res> {
  __$TodoStateCopyWithImpl(this._self, this._then);

  final _TodoState _self;
  final $Res Function(_TodoState) _then;

/// Create a copy of TodoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? todos = null,Object? coins = null,}) {
  return _then(_TodoState(
todos: null == todos ? _self._todos : todos // ignore: cast_nullable_to_non_nullable
as List<TodoModel>,coins: null == coins ? _self._coins : coins // ignore: cast_nullable_to_non_nullable
as List<Coin>,
  ));
}


}

// dart format on
