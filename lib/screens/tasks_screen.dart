// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:firebase_test/constants.dart';
import 'package:firebase_test/models/task_data.dart';
import 'package:firebase_test/widgets/add_task.dart';
import 'package:firebase_test/widgets/tasks_list.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                      child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTask(),
                  )));
        },
        backgroundColor: bgColor,
        child: Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 30, bottom: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    child: Icon(
                      Icons.list,
                      size: 30,
                      color: bgColor,
                    ),
                    backgroundColor: white,
                    radius: 30),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Lista",
                  style: TextStyle(
                      color: white, fontWeight: FontWeight.w700, fontSize: 50),
                ),
                Text(
                  "${Provider.of<TaskData>(context).taskCount} Tasks",
                  style: TextStyle(color: white, fontSize: 18),
                ),
              ],
            ),
          ),
          TasksList()
        ],
      ),
    );
  }
}
