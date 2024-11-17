import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task.dart';
import '../providers/task_provider.dart';

class AddEditTaskScreen extends StatefulWidget {
  final Task? task;
  const AddEditTaskScreen({super.key, this.task});

  @override
  State<AddEditTaskScreen> createState() => _AddEditTaskScreenState();
}

class _AddEditTaskScreenState extends State<AddEditTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;
  late DateTime _dueDate;
  late String _priority;

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.task == null ? 'Add Task' : 'Edit Task')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: widget.task?.title ?? '',
                decoration: InputDecoration(labelText: 'Title'),
                onSaved: (value) => _title = value!,
              ),
              TextFormField(
                initialValue: widget.task?.description ?? '',
                decoration: InputDecoration(labelText: 'Description'),
                onSaved: (value) => _description = value!,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    if (widget.task == null) {
                      taskProvider.addTask(Task(
                        id: DateTime.now().toString(),
                        title: _title,
                        description: _description,
                        dueDate: _dueDate,
                        priority: _priority,
                      ));
                    } else {
                      taskProvider.editTask(Task(
                        id: widget.task!.id,
                        title: _title,
                        description: _description,
                        dueDate: _dueDate,
                        priority: _priority,
                        isComplete: widget.task!.isComplete,
                      ));
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(widget.task == null ? 'Add' : 'Save'),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
