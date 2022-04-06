// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, must_be_immutable

import 'package:firebase_test/constants.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  bool isChecked = false;
  final String taskTitle;
  final Function(bool?) checkBoxCB;
  final VoidCallback longPressCB;
  TaskTile({required this.taskTitle,required this.isChecked,required this.checkBoxCB, required this.longPressCB});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCB,
        title: Text(
          taskTitle,
          style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          activeColor: primary,
          onChanged: checkBoxCB,
          value: isChecked,
        ));
  }
}

