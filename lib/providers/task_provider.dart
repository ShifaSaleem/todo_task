import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [
    Task(
      id: '1',
      title: 'Buy groceries',
      description: 'Get milk, eggs, bread, and fruits',
      dueDate: DateTime.now().add(Duration(days: 1)),
      priority: 'High',
      isComplete: false,
    ),
    Task(
      id: '2',
      title: 'Complete project report',
      description: 'Finish the final draft of the project report',
      dueDate: DateTime.now().add(Duration(days: 3)),
      priority: 'Medium',
      isComplete: false,
    ),
    Task(
      id: '3',
      title: 'Workout session',
      description: 'Attend the evening workout class',
      dueDate: DateTime.now().add(Duration(days: 2)),
      priority: 'Low',
      isComplete: true,
    ),
    Task(
      id: '4',
      title: 'Team meeting',
      description: 'Discuss project progress with the team',
      dueDate: DateTime.now().add(Duration(days: 4)),
      priority: 'High',
      isComplete: false,
    ),
  ];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void editTask(Task updatedTask) {
    final index = _tasks.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      _tasks[index] = updatedTask;
      notifyListeners();
    }
  }

  void toggleComplete(String id) {
    final task = _tasks.firstWhere((task) => task.id == id);
    task.isComplete = !task.isComplete;
    notifyListeners();
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }
}
