// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// class - widget of the TODO CARD contents so we can use it as a widget easily in the main class

class TodoCard extends StatelessWidget {
  //todo card attributes
  final String vartitle;
  final bool doneORnot;
  final int indexOFTheTask;
  // the type of this attributes its "Function" why ? because it basically a method - function we want it to be executed
  final Function changeTheStatus;
  final Function removeTask;
// most important that we make a constructor to get the data

  const TodoCard(
      {super.key,
      required this.vartitle,
      required this.doneORnot,
      required this.indexOFTheTask,
      required this.changeTheStatus,
      required this.removeTask});

  @override
  Widget build(BuildContext context) {
//GestureDetector we use this widget to make the icon be clickable by using the "onTap" propriety and passing the method we want to be executed
    return GestureDetector(
      onTap: () {
        changeTheStatus(indexOFTheTask);
      },
      // FractionallySizedBox نستخدم هذي الودجيت في حال كنا نبغى المشروع حقنا يبان كويس بكل الشاشات نحدد له قيمه محدده يا ارتفاع يا عرض في حالتنا هذه احنا بس مهتمين بالعرض
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.yellow[200],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                // vartitle هذا النص الي راح ينعرض هو البيانات الي اخذناها من المتغير
                vartitle,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 38, 36, 36),
                    decoration: doneORnot
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    // نستخدم الجملة الشرطية المختصرة عشان نخلي الايكون اما صح او خطأ
                    doneORnot ? Icons.check : Icons.close,
                    //نفس الشي نستخدمه للون
                    color: doneORnot ? Colors.green : Colors.red,
                    size: 30,
                  ),
                  SizedBox(
                    width: 22,
                  ),
                  IconButton(
                    onPressed: () {
                      removeTask(indexOFTheTask);
                    },
                    icon: Icon(Icons.delete),
                    color: Colors.black,
                    iconSize: 28,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
