import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_sample/cache/cache_manager.dart';
import 'package:hive_sample/constants.dart';
import 'package:hive_sample/widgets/model_bottom_sheet.dart';
import '../cache/model/todo_model.dart';
import 'todolist_tile.dart';

class TaskApp extends StatefulWidget {
  const TaskApp({super.key});

  @override
  State<TaskApp> createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {
  final TextEditingController _textFieldController = TextEditingController();
  late final CacheManager _cacheManager;

  @override
  void initState() {
    super.initState();
    _cacheManager = CacheManager();
  }

  Future<void> deleteTodo(index) async {
    await _cacheManager.deleteTodo(index);
  }

  Future<void> addTodo(value) async {
    await _cacheManager.addTodo(value);
  }

  void showFormOnPressed(BuildContext context) =>
      showForm(context, _textFieldController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TextLibrary.appBarText),
      ),
      body: ValueListenableBuilder(
          valueListenable: _cacheManager.todoBox.listenable(),
          builder: (context, Box<TodoModel> box, _) {
            return ListView.builder(
                itemCount: box.length,
                itemBuilder: (context, index) {
                  final todo = box.getAt(index)!;
                  return TodoListTile(
                    todo: todo,
                    index: index,
                    onDelete: deleteTodo,
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showFormOnPressed(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
