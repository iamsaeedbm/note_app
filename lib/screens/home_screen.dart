import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:note_app/data/task.dart';
import 'package:note_app/screens/add_task_screen.dart';
import 'package:note_app/widgets/task_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var box = Hive.box('names');
  String inputText = '';
  var controller = TextEditingController();
  var taskBox = Hive.box<Task>('taskBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            itemCount: taskBox.length,
            itemBuilder: ((context, index) {
              var task = taskBox.values.toList()[index];
              return TaskWidget(task: task);
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => AddTaskScreen()));
        },
        backgroundColor: Colors.greenAccent,
        child: Image.asset('images/icon_add.png'),
      ),
    );
  }
}
