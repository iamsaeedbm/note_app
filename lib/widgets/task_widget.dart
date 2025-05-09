import 'package:flutter/material.dart';
import 'package:note_app/data/task.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget({super.key, required this.task});
  Task task;
  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isBoxCheked = false;

  @override
  void initState() {
    super.initState();
    isBoxCheked = widget.task.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return getTaskItem();
  }

  Widget getTaskItem() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isBoxCheked = !isBoxCheked;
          widget.task.isDone = isBoxCheked;
          widget.task.save();
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        height: 132,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: getMainContent(),
        ),
      ),
    );
  }

  Row getMainContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(value: isBoxCheked, onChanged: (isChecked) {}),
                  Text(widget.task.title),
                ],
              ),
              Text(widget.task.subTitle, overflow: TextOverflow.ellipsis),
              Spacer(),
              getTimeAndEditBadgs(),
            ],
          ),
        ),
        SizedBox(width: 20),
        Image.asset('images/workout.png'),
      ],
    );
  }

  Column getTimeAndEditBadgs() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 90,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: Row(
                  children: [
                    Text(
                      '22:22',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Image.asset('images/icon_time.png'),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: 90,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.greenAccent[100],
                borderRadius: BorderRadius.circular(18),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: Row(
                  children: [
                    Text(
                      'edit',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Image.asset('images/icon_edit.png'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
