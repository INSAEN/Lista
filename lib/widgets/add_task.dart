// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable
import 'package:firebase_test/constants.dart';
import 'package:firebase_test/models/task_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTask extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: shadow,
      child: Container(
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Container(
          padding: EdgeInsets.only(top: 10),
          child: Column(children: [
            Text(
              "Add task",
              textAlign: TextAlign.center,
              style: TextStyle(color: primary, fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: bgColor, width: 2.0),
                  ),
                ),
                autofocus: true,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                  onPressed: () {
                    Provider.of<TaskData>(context,listen: false).addTask(nameController.text);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(primary: bgColor),
                  child: Text(
                    "Add",
                    style: TextStyle(fontSize: 18, color: white),
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
