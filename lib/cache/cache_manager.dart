import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_sample/cache/model/todo_model.dart';

class CacheManager {
  CacheManager? prefs;
  final Box<TodoModel> todoBox = Hive.box<TodoModel>('todos');
  CacheManager();
  Future<void> addTodo(String value) async {
    final todo = TodoModel(description: value);
    todoBox.add(todo);
  }

  Future<void> deleteTodo(int index) {
    return todoBox.deleteAt(index);
  }
}
