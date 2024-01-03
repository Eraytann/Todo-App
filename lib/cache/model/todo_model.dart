import 'package:hive_flutter/hive_flutter.dart';
part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel {
  @HiveField(0)
  String description;

  @HiveField(1)
  bool isDone;

  TodoModel({required this.description, this.isDone = false});
}
