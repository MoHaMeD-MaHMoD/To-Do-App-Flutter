// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  final String taskTitle;
  final bool doneOrNot;

  const ToDoCard({super.key, required this.doneOrNot, required this.taskTitle});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: .92,
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 126, 0.8),
            borderRadius: BorderRadius.circular(9)),
        padding: EdgeInsets.all(22),
        margin: EdgeInsets.only(top: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              taskTitle,
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            Icon(doneOrNot ? Icons.check : Icons.close,
            size: 34,
                color: doneOrNot ? Colors.green : Colors.red),
          ],
        ),
      ),
    );
  }
}
