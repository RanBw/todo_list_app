// ignore_for_file: prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:todo_list_p1/widgets/counter.dart';
import 'package:todo_list_p1/widgets/todo-card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ToDoApp(),
    );
  }
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class Task {
  String title;
  bool status;

  Task({required this.title, required this.status});
}

class _ToDoAppState extends State<ToDoApp> {
  // creating a controller to control or text field "text"
  // it has so many methods ....
  // we can get the text inside the text field
  final myContoller = TextEditingController();

  String dataEnterd = "";
  List tasks = [
    Task(title: "doing exercise", status: true),
    Task(title: "eat breakfast", status: true),
    Task(title: "learn flutter", status: true),
    Task(title: "watching anime", status: true),
    Task(title: "call mom", status: true),
    Task(title: "call dad", status: false),
  ];

//to add new task into the tasks list
  void addNewTask() {
    setState(() {
      dataEnterd = myContoller.text;

      if (dataEnterd == "") {
      } else {
        tasks.add(Task(title: dataEnterd, status: false));
      }
    });
  }

// to calculate the completed tasks you have done
// we used ".forEach" not ".map" so we can get a number not a list
  int CalcCompletedTasks() {
    int count = 0;
    tasks.forEach((item) {
      if (item.status) {
        count++;
      }
    });
    return count;
  }

// to change the status of the task by clicking on the Icon or the card
  changeStatus(int myIndex) {
    setState(() {
      tasks[myIndex].status = !tasks[myIndex].status;
      //tasks[myIndex].title = !tasks[myIndex].title.
    });
  }

// delete task once you click on the delete Icon
  removeTasksFromTheList(int myIndex) {
    setState(() {
      tasks.removeAt(myIndex);
    });
  }

// to delete all tasks in the list or in the todo app
  void removeAllTasks() {
    setState(() {
      tasks.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // we create a "floatingActionButton" and when we clicked on it the dialog widget shows up and from here we can add new tasks
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11)),
                child: Container(
                  padding: EdgeInsets.all(22),
                  height: 250,
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextField(
                        controller: myContoller,
                        decoration: InputDecoration(),
                      ),
                      TextButton(
                          onPressed: () {
                            addNewTask();

                            Navigator.pop(context);
                          },
                          child: Text(
                            "ADD",
                            style: TextStyle(fontSize: 22),
                          ))
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Color.fromARGB(255, 5, 41, 66),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
          // we use actions attribute  the actions attribute used to add element on the right of the app bar
          actions: [
            // the delete icon for removing all tasks from the list
            IconButton(
              onPressed: () {
                removeAllTasks();
              },
              icon: Icon(Icons.delete_forever),
              iconSize: 44,
            )
          ],
          title: Text(
            "TO DO APP ",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, wordSpacing: 2),
          ),
          centerTitle: false,
          backgroundColor: Color.fromARGB(255, 5, 41, 66)),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //creating counter widget - class in the widgets folder to count the number of the completing tasks
            // and passing to the constructor the number of tasks length list and the number of the completed tasks
            Counter(
              listLength: tasks.length,
              completedTasks: CalcCompletedTasks(),
            ),

            SizedBox(
              // listview widgets most be wrapped with sized box or container so that we have to give it a ***  height *** other wise in will not be shown
              height: 500,
              child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    // passing to the todocard constructor the values of the attributes that we had in the TodoCard class - widget
                    return TodoCard(
                      vartitle: tasks[index].title,
                      doneORnot: tasks[index].status,
                      indexOFTheTask: index,
                      changeTheStatus: changeStatus,
                      removeTask: removeTasksFromTheList,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
