import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int allTask;
  final int tasksCompleted;

  const Counter(
      {super.key, required this.tasksCompleted, required this.allTask});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 27),
      child: Text("$tasksCompleted/$allTask",
          style: TextStyle(
              fontSize: 44,
              color: tasksCompleted == allTask
                  ? Color.fromRGBO(0, 158, 0, 0.8)
                  : Color.fromRGBO(158, 0, 0, 0.8),
              fontWeight: FontWeight.bold)),
    );
  }
}
