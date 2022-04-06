// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, non_constant_identifier_names, must_be_immutable

import 'package:firebase_test/constants.dart';
import 'package:firebase_test/models/task_data.dart';
import 'package:firebase_test/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Consumer<TaskData>(builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.taskCount,
          itemBuilder: (BuildContext context, int index) {
            return TaskTile(
                longPressCB: () {
                  taskData.deleteTask(taskData.tasks[index]);
                },
                taskTitle: taskData.tasks[index].name,
                isChecked: taskData.tasks[index].isDone,
                checkBoxCB: (bool? value) {
                  taskData.updateTask(taskData.tasks[index]);
                });
          },
        );
      }),
    ));
  }
}
