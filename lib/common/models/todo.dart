import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class TodoModel with _$TodoModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TodoModel({
    String? user_id,
    String? id,
    required String name,
    required String description,
    @Default(false) bool status,
  }) = _TodoModel;

  factory TodoModel.fromJson(Map<String, Object?> json) =>
      _$TodoModelFromJson(json);
}
