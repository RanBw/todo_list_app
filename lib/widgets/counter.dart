import 'package:flutter/material.dart';

// the Counter class - widget
class Counter extends StatelessWidget {
  // initialize the attribute of the class
  final int listLength;
  final int completedTasks;
  // most important that we make a constructor to get the data
  const Counter(
      {super.key, required this.listLength, required this.completedTasks});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 27),
      child: Text(
        // completedTasks and listLength attribute that we got from the main
        "$completedTasks/$listLength",
        style: TextStyle(
            color: completedTasks == listLength ? Colors.green : Colors.black,
            fontSize: 33),
      ),
    );
  }
}
