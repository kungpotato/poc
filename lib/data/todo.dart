class Todo {
  Todo({
    required this.description,
    required this.completed,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
  final String description;
  final bool completed;
  final DateTime createdAt;
}
