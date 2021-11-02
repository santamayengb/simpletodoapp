import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todoappme/todo/model/todo_model.dart';

part 'todocubit_state.dart';

class TodocubitCubit extends Cubit<TodocubitState> {
  TodocubitCubit() : super(const TodocubitState(todolist: []));

  void addtodo(TodoModel todo) {
    final newtodo = state.copyWith(todolist: [...state.todolist, todo]);
    //  todoList.add(TodoModel(name: tname, description: ""));
    emit(newtodo);
  }

  void removetodo(TodoModel todo) {
    emit(state.copyWith(
        todolist: state.todolist.where((element) => element != todo).toList()));
    // todoList.remove(todoList[index]);
  }
}
