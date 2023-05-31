// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ToDoCard extends StatelessWidget {
  final String taskTitle;
  final bool doneOrNot;
  final int index;
  final Function changeStatus;
  final Function deleteTask;

  const ToDoCard({
    super.key,
    required this.taskTitle,
    required this.deleteTask,
    required this.doneOrNot,
    required this.changeStatus,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeStatus(index);
      },
      child: FractionallySizedBox(
        widthFactor: .92,
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 126, 0.8),
              borderRadius: BorderRadius.circular(9)),
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(top: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                taskTitle,
                style: TextStyle(
                  fontSize: 24,
                  color: doneOrNot ? Colors.grey[500] : Colors.white,
                  decoration: doneOrNot
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              Row(
                children: [
                  Icon(doneOrNot ? Icons.check : Icons.close,
                      size: 34,
                      color: doneOrNot
                          ? Color.fromRGBO(0, 158, 0, 0.8)
                          : Color.fromRGBO(158, 0, 0, 0.8)),
                  SizedBox(
                    width: 16,
                  ),
                  IconButton(
                      onPressed: () {
                        deleteTask(index);
                      },
                      color: Color.fromRGBO(206, 127, 127, 0.8),
                      iconSize: 34,
                      icon: Icon(
                        Icons.delete,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
