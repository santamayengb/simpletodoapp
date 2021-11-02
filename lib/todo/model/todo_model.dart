class TodoModel {
  final String name;
  final String description;
  final bool isDone;

  TodoModel(
      {required this.name, required this.description, this.isDone = false});

  TodoModel copyWith({String? name, String? description, bool? isDone}) {
    return TodoModel(
        name: name ?? this.name,
        description: description ?? this.description,
        isDone: isDone ?? this.isDone);
  }
}
