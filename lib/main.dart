import 'package:flutter/material.dart';
import 'package:hive_sample/constants.dart';
import 'cache/hive_init.dart';
import 'pages/home.dart';

void main() async {
  await hiveInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: TextLibrary.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: false,
      ),
      home: const TaskApp(),
    );
  }
}
