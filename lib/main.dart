// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:todo_app/widget/Counter.dart';

import 'widget/ToDOCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: true,
      home: ToDoApp(),
    );
  }
}

final myController = TextEditingController();

class Task {
  String task;
  bool status;

  Task({required this.task, required this.status});
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  List tasks = [
    Task(task: "go to school ", status: true),
    Task(task: "gplay fol ", status: true),
    Task(task: "visit unt  ", status: true),
    Task(task: "visit unt  ", status: true)
  ];
  int cacuDonTaskNum() {
    int counter = 0;
    tasks.forEach((item) {
      if (item.status) {
        counter++;
      }
    });
    return counter;
  }

  changeStatus(int index) {
    setState(() {
      tasks[index].status = !tasks[index].status;
    });
  }

  addTask() {
    setState(() {
      if (!myController.text.isEmpty) {
        tasks.add(Task(task: myController.text, status: false));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Color.fromRGBO(0, 0, 79, 0.8),
            child: Icon(Icons.add),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9)),
                    child: Container(
                      height: 205,
                      padding: EdgeInsets.fromLTRB(20, 30, 20, 40),
                      child: Column(children: [
                        TextField(
                          controller: myController,
                          maxLength: 20,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(158, 158, 0, 0.8)),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 3,
                                  color: Color.fromRGBO(158, 158, 0, 0.8)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelText: "Add new Task",
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              addTask();
                              Navigator.pop(context);
                            },
                            child: Text(
                              "ADD",
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Color.fromRGBO(158, 158, 0, 0.8)),
                            ))
                      ]),
                    ),
                  );
                },
              );
            }),
        backgroundColor: Color.fromRGBO(204, 204, 235, 0.8),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(0, 0, 79, 0.8),
          title: Text(
            "To DO App",
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          elevation: 0,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Counter(tasksCompleted: cacuDonTaskNum(), allTask: tasks.length),
              Container(
                height: 600,
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ToDoCard(
                      taskTitle: tasks[index].task,
                      doneOrNot: tasks[index].status,
                      changeStatus: changeStatus,
                      index: index,
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
