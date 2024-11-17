import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../providers/task_provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard',
        style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list,color: Colors.white),
            onPressed: () {
              // Implement filter logic
            },
          ),
        ],
      ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addEditTask');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
