import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => AddTaskScreenState();
}

class AddTaskScreenState extends State<AddTaskScreen> with ChangeNotifier {
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  List<Task> tasks = [
    Task(name: 'Hey Welcome! 😊', isDone: false),
    Task(name: 'Hit the ➕ button to add new item', isDone: false),
    Task(name: '✔ on the box to mark it as completed task ✌', isDone: false),
    Task(name: 'Long press on the item to delete it', isDone: false),
  ];

  initSharedPreferences() async {
    List<Task> taskk = await loadData();
    setState(() {
      tasks = taskk;
    });
  }

  int get taskCount {
    return tasks.length;
  }

  void addTask(String newTaskTitle) {
    final task = Task(name: newTaskTitle);
    tasks.add(task);
    saveData();
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    saveData();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    saveData();
    notifyListeners();
    if (tasks.length == 0) {
      tasks.add(Task(name: 'Hey Welcome! 😊', isDone: false));
      tasks.add(Task(name: 'Hit the ➕ button to add new item', isDone: false));
      tasks.add(Task(
          name: '✔ on the box to mark it as completed task ✌', isDone: false));
      tasks.add(
          Task(name: 'Long press on the item to delete it', isDone: false));
    }
  }

  Future<List<Task>> loadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> spList =
        sharedPreferences.getStringList('task') ?? <String>['Helloo', 'false'];
    tasks = spList.map((item) => Task.fromMap(json.decode(item))).toList();
    setState(() {});
    return tasks;
  }

  Future<List<String>> saveData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> spList =
        tasks.map((item) => json.encode(item.toMap())).toList();
    sharedPreferences.setStringList('task', spList);
    return spList;
  }

  @override
  Widget build(BuildContext context) {
    late String newTaskTitle;
    return Container(
      color: Color(0xFF25252F),
      child: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Color(0xFF262530),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task 📝',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.0,
                fontFamily: 'Pacifico',
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newValue) {
                newTaskTitle = newValue;
              },
            ),
            FlatButton(
              child: Text(
                'ADD TO THE LIST ✔',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Provider.of<AddTaskScreenState>(context, listen: false)
                    .addTask(newTaskTitle);
                Navigator.pop(context);
              },
              color: Color(0xFFF95131),
            )
          ],
        ),
      ),
    );
  }
}
