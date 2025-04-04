import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:poc/screens/todo/todo_model.dart';

part 'todo_state.freezed.dart';

class Coin {
  Coin({required this.symbol, required this.price});

  final String symbol;
  final double price;
}

@freezed
abstract class TodoState with _$TodoState {
  factory TodoState({
    required List<TodoModel> todos,
    required List<Coin> coins,
  }) = _TodoState;

  TodoState._();
}
