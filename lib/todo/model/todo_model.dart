class TodoModel {
  final String name;
  final String description;
  final bool isDone;

  TodoModel(
      {required this.name, required this.description, this.isDone = false});

  List<TodoModel> tasklist = [];
}
