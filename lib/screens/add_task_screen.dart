import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:note_app/data/task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  final TextEditingController controllerTaskTitle = TextEditingController();
  final TextEditingController controllerTaskSubTitle = TextEditingController();
  final box = Hive.box<Task>('taskBox');
  @override
  void initState() {
    super.initState();
    focusNode1.addListener(() {
      setState(() {});
    });

    focusNode2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 44),
                child: TextField(
                  controller: controllerTaskTitle,
                  focusNode: focusNode1,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    labelText: 'task title',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: focusNode1.hasFocus ? Colors.green : Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: Color(0xffC5C5C5),
                        width: 3.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(width: 3, color: Colors.green),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 44),
                child: TextField(
                  controller: controllerTaskSubTitle,
                  focusNode: focusNode2,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    labelText: 'subtitle',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      color: focusNode2.hasFocus ? Colors.green : Colors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: Color(0xffC5C5C5),
                        width: 3.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(width: 3, color: Colors.green),
                    ),
                  ),
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  String taskTitle = controllerTaskTitle.text;
                  String taskSubTitle = controllerTaskSubTitle.text;

                  addTask(taskTitle, taskSubTitle);
                  Navigator.of(context).pop();
                },
                child: Text('add task'),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  addTask(String taskTitle, String taskSubTitle) {
    var task = Task(title: taskTitle, subTitle: taskSubTitle);
    box.add(task);
  }
}
