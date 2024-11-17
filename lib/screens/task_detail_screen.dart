import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task_provider.dart';

class TaskDetailScreen extends StatefulWidget {
  final String? taskId;
  const TaskDetailScreen({super.key, this.taskId});

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final task = taskProvider.tasks.firstWhere((task) => task.id == widget.taskId);

    return Scaffold(
      appBar: AppBar(title: Text(task.title)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Description: ${task.description}'),
            Text('Due Date: ${task.dueDate}'),
            Text('Priority: ${task.priority}'),
            Row(
              children: [
                Text('Status: '),
                Checkbox(
                  value: task.isComplete,
                  onChanged: (bool? value) {
                    taskProvider.toggleComplete(task.id);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
