import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var box = Hive.box('names');
  String inputText = '';
  var controller = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 132,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MSHCheckbox(
                    size: 30,
                    value: isChecked,
                    colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                      checkedColor: Colors.green,
                    ),
                    style: MSHCheckboxStyle.fillScaleCheck,
                    onChanged: (selected) {
                      setState(() {
                        isChecked = selected;
                      });
                    },
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text('data'),
                      Text('data'),
                      Row(
                        children: [
                          Container(
                            width: 83,
                            height: 28,
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
                                  Image.asset('images/icon_time.png'),
                                  Text('time'),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 83,
                            height: 28,
                            decoration: BoxDecoration(
                              color: Colors.greenAccent[100],
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset('images/workout.png'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
