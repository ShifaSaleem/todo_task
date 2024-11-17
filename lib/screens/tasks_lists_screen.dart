import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../providers/task_provider.dart';

class TasksListsScreen extends StatefulWidget {
  const TasksListsScreen({super.key});

  @override
  State<TasksListsScreen> createState() => _TasksListsScreenState();
}

class _TasksListsScreenState extends State<TasksListsScreen> {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Tasks List')),
      body: ListView.builder(
        itemCount: taskProvider.tasks.length,
        itemBuilder: (context, index) {
          Task task = taskProvider.tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text('Due: ${task.dueDate}'),
            trailing: Checkbox(
              value: task.isComplete,
              onChanged: (bool? value) {
                taskProvider.toggleComplete(task.id);
              },
            ),
            onTap: () {
              Navigator.pushNamed(context, '/taskDetail', arguments: task.id);
            },
          );
        },
      ),
    );
  }
}
