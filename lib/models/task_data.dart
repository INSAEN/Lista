import 'package:firebase_test/models/task.dart';
import 'package:flutter/foundation.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasks = [Task(name: "Buy milk"), Task(name: "Buy Choco")];
  int get taskCount {
    return tasks.length;
  }

  void addTask(String name) {
    final task = Task(name: name);
    tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggle();
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }
}
