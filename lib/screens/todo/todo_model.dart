import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.freezed.dart';
part 'todo_model.g.dart';

@freezed
abstract class TodoModel with _$TodoModel {
  @Assert('title.isNotEmpty', 'title cannot be empty')
  factory TodoModel({
    required String id,
    required String title,
    @Default(false) bool completed,
  }) = _TodoModel;

  TodoModel._();

  factory TodoModel.fromJson(Map<String, dynamic> json) =>
      _$TodoModelFromJson(json);
}
