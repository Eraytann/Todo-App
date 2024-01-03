import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'model/todo_model.dart';

Future<void> hiveInit() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TodoModelAdapter());

  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  await Hive.openBox<TodoModel>('todos');
}
