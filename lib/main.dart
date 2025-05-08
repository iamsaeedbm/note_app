import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:note_app/data/task.dart';
import 'package:note_app/screens/add_task_screen.dart';
import 'package:note_app/screens/home_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('names');
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('taskBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: AddTaskScreen(),
    );
  }
}
