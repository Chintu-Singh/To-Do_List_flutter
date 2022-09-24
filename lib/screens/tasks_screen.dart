import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todoey_flutter/widgets/task_list.dart';
import 'add_screens.dart';
import 'package:provider/provider.dart';

var now = new DateTime.now();
var formatter = new DateFormat('yyyy-MM-dd');
String formattedDate = formatter.format(now);

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0x000000),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(Icons.add),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => AddTaskScreen(),
            );
          },
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: 60.0, bottom: 30.0, left: 30.0, right: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.list_alt_rounded,
                          size: 30.0,
                          color: Color(0xFF25242F),
                        ),
                        backgroundColor: Colors.white,
                        radius: 30.0,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        formattedDate,
                        style: TextStyle(
                          fontSize: 35.0,
                          fontFamily: 'Pacifico',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'To-Do List',
                    style: TextStyle(
                      color: Color(0xFFF95131),
                      fontSize: 50.0,
                      fontFamily: 'Pacifico',
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Text(
                    '${Provider.of<AddTaskScreenState>(context).taskCount} Tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontFamily: 'Pacifico',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFF95131),
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 15.0,
                      spreadRadius: 5.0,
                    ),
                  ],
                  color: Color(0xFF2C2835),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: TasksList(),
              ),
            ),
          ],
        ));
  }
}
