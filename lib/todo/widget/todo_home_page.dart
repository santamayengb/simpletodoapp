import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:todoappme/todo/cubit/todocubit_cubit.dart';
import 'package:todoappme/todo/model/todo_model.dart';

class TodoHomePage extends StatelessWidget {
  const TodoHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoliststate = context.watch<TodocubitCubit>().state;
    final todolist = todoliststate.todolist;

    String tname = "";
    final _text = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: const Text("TodoApp"),
          centerTitle: true,
        ),
        body: ListView.separated(
            itemCount: todolist.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final todo = todolist[index];
              return ListTile(
                title: Text(todo.name),
                subtitle: Text(todo.description),
                trailing: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.delete)),
              );
            }),
        //---
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Add new Task"),
                      content: TextField(
                        controller: _text,
                        decoration: const InputDecoration(
                            labelText: "Task Name",
                            hintText: "Enter Task Name",
                            border: OutlineInputBorder()),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            tname = _text.text;
                            final todocubit = context.read<TodocubitCubit>();
                            final newtodo = TodoModel(
                                name: tname, description: "", isDone: false);

                            todocubit.addtodo(newtodo);

                            Navigator.of(context).pop();
                          },
                          child: const Text("Add"),
                        )
                      ],
                    );
                  });
            })
        //----
        );
  }
}
