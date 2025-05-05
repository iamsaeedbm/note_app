import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var box = Hive.box('names');
  String inputText = '';
  var controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextField(controller: controller),
              Text(inputText),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
                child: Text('press'),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  box.put(1, controller);
                },
                child: Text('create'),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
                child: Text('read'),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
                child: Text('update'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
