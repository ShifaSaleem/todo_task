class Task {
  String id;
  String title;
  String description;
  DateTime dueDate;
  String priority;
  bool isComplete;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.priority,
    this.isComplete = false,
  });
}
