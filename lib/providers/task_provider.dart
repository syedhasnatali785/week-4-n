import 'package:flutter/material.dart';

class TaskProvider with ChangeNotifier {
  List<String> tasks = [];

  void addTask(String task) {
    tasks.add(task);
    notifyListeners();
  }

  void deleteTask(int index) {
    tasks.removeAt(index);
    notifyListeners();
  }
}
