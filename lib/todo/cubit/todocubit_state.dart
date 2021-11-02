part of 'todocubit_cubit.dart';

class TodocubitState extends Equatable {
  const TodocubitState({required this.todolist});

  final List<TodoModel> todolist;

  @override
  List<Object?> get props => [todolist];

  TodocubitState copyWith({List<TodoModel>? todolist}) {
    return TodocubitState(
      todolist: todolist ?? this.todolist,
    );
  }
}
