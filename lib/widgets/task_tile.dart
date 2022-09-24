import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallback;
  final Function() longPressCallback;

  TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkboxCallback,
    required this.longPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Color(0xFFF95131),
        value: isChecked,
        onChanged: checkboxCallback, //toggleCheckboxState
      ),
    );
  }
}

// class TaskCheckBox extends StatelessWidget {
//   final bool checkboxState;
//   final Function(bool?) toggleCheckboxState;
//   TaskCheckBox(
//       {required this.checkboxState, required this.toggleCheckboxState});
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       activeColor: Colors.lightBlueAccent,
//       value: checkboxState,
//       onChanged: toggleCheckboxState,
//     );
//   }
// }
