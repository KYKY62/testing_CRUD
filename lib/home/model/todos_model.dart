import 'dart:convert';

class TodosModel {
  final int? id;
  final String? todo;
  bool completed;
  final int? userId;

  TodosModel({
    this.id,
    this.todo,
    required this.completed,
    this.userId,
  });

  factory TodosModel.fromRawJson(String str) =>
      TodosModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TodosModel.fromJson(Map<String, dynamic> json) => TodosModel(
        id: json["id"],
        todo: json["todo"],
        completed: json["completed"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "todo": todo,
        "completed": completed,
        "userId": userId,
      };
}
