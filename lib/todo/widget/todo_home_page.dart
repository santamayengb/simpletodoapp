import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todoappme/todo/model/todo_model.dart';

class TodoHomePage extends StatefulWidget {
  const TodoHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<TodoHomePage> createState() => _TodoHomePageState();
}

class _TodoHomePageState extends State<TodoHomePage> {
  @override
  Widget build(BuildContext context) {
    final _todoList = <TodoModel>[];

    // _todoList.add(TodoModel(name: "name", description: "description"));
    // _todoList.add(TodoModel(name: "name", description: "description"));
    //_todoList.add(TodoModel(name: "name", description: "description"));

    String tname = "";
    final _text = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: const Text("TodoApp"),
          centerTitle: true,
        ),
        body: ListView.separated(
            itemCount: _todoList.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_todoList[index].name),
                subtitle: Text(_todoList[index].description),
                trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        _todoList.remove(_todoList[index]);
                      });
                    },
                    icon: const Icon(Icons.delete)),
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
                            setState(() {
                              tname = _text.text;
                              _todoList
                                  .add(TodoModel(name: tname, description: ""));
                            });
                            log(tname);

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
