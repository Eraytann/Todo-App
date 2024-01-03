import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_sample/widgets/confirm_dialog.dart';
import '../cache/model/todo_model.dart';

class TodoListTile extends StatelessWidget {
  const TodoListTile(
      {super.key,
      required this.todo,
      required this.index,
      required this.onDelete});

  final TodoModel todo;
  final int index;
  final void Function(int) onDelete;

  @override
  Widget build(BuildContext context) {
    Future<dynamic> deleteOnPressed(BuildContext context) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return DeleteConfirmDialog(onDelete: onDelete, index: index);
        },
      );
    }

    void addTodo() {
      final newTodo = TodoModel(
        description: todo.description,
        isDone: !todo.isDone,
      );
      Hive.box<TodoModel>('todos').putAt(index, newTodo);
    }

    Color borderFunc(BuildContext context) =>
        todo.isDone ? Theme.of(context).primaryColor : Colors.grey;

    TextDecoration textDecoration() =>
        todo.isDone ? TextDecoration.lineThrough : TextDecoration.none;

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(
          todo.description,
          style: TextStyle(
            decoration: textDecoration(),
          ),
        ),
        leading: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: borderFunc(context),
              width: 2,
            ),
          ),
          child: Center(
            child: todo.isDone
                ? Icon(
                    Icons.check,
                    size: 16,
                    color: Theme.of(context).primaryColor,
                  )
                : null,
          ),
        ),
        onTap: () {
          addTodo();
        },
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () => deleteOnPressed(context),
        ),
      ),
    );
  }
}
