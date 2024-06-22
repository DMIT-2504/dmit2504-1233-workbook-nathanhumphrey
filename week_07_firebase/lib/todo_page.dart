import "package:flutter/material.dart";
import "package:week_07_firebase/app_state.dart";
import "models/todo.dart";

class TodoPage extends StatefulWidget {
  const TodoPage({required this.appState, super.key});

  final AppState appState;

  @override
  State<TodoPage> createState() => _TodoState();
}

class _TodoState extends State<TodoPage> {
  List<Todo> _todoList = [];

  @override
  void initState() {
    setState(() {
      _todoList = widget.appState.todos!;
    });
    // Test with some local Todo objects
    // _todoList.add(Todo(description: 'Buy Groceries', completed: false));
    // _todoList.add(Todo(description: 'Pay Bills', completed: false));
    // _todoList.add(Todo(description: 'Get Gas', completed: true));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: _buildList(_todoList),
    ));
  }

  Widget _buildList(List<Todo> todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];

        return Dismissible(
          key: UniqueKey(),
          child: ListTile(
            title: Text(
              todo.description,
              style: todo.completed
                  ? const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontStyle: FontStyle.italic)
                  : null,
            ),
            shape: const Border(
              bottom: BorderSide(
                color: Colors.grey,
              ),
            ),
            trailing: Checkbox(
              value: todo.completed,
              onChanged: (value) {
                // update the todo in the database
                print(value);
              },
            ),
          ),
          onDismissed: (direction) {
            setState(() {
              todos.remove(todo);
              // delete the todo in the database
            });
            print(direction);
          },
        );
      },
    );
  }
}
