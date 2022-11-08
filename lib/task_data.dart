import 'package:flutter/material.dart';

class Task {
  final String title;
  bool isDone;

  Task({required this.title, this.isDone = false});

  void doneChange() {
    isDone = !isDone;
  }
}

class TaskData extends ChangeNotifier {
  List<Task> tasks = [
    Task(title: 'buy grocery'),
    Task(title: 'send email to ...'),
  ];
  int doneTasks = 0;

  void addTask(String newTaskTitle) {
    tasks.insert(0, Task(title: newTaskTitle));
    notifyListeners();
  }

  void updateTask(Task task) {
    task.doneChange();
    tasks.remove(task);
    if (task.isDone) {
      doneTasks++;
      tasks.add(task);
    } else {
      doneTasks--;
      tasks.insert(0, task);
    }
    notifyListeners();
  }

  void deleteTask(Task task) {
    tasks.remove(task);
    if (task.isDone) {
      doneTasks--;
    }
    notifyListeners();
  }
}
