import 'package:day17/model.dart/todovalue.dart';
import 'package:day17/screen/addItem.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Todovalue> todos = [];

  @override
  void initState() {
    super.initState();
    loadTodos(); // Load existing todos when homepage starts
  }

  // Load todos from shared preferences
  void loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final String? todoString = prefs.getString('todos');
    if (todoString != null) {
      setState(() {
        todos = Todovalue.decode(todoString);
      });
    }
  }

  // Save todos to shared preferences
  void saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('todos', Todovalue.encode(todos));
  }

  // Navigate to AddTodo and refresh after coming back
  void addTodo() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddTodo()),
    );
    loadTodos(); // refresh after returning
  }

  void deleteAllTodos() async {
    if (todos.isEmpty) return; // nothing to delete

    // Optional: Show confirmation dialog
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete All Todos"),
        content: const Text("Are you sure you want to delete all todos?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false), // cancel
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true), // confirm
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm != true) return; // user canceled

    // Clear the list
    setState(() {
      todos.clear();
    });

    // Remove from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('todos');

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('All todos deleted')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: deleteAllTodos, icon: Icon(Icons.delete_sweep)),
        ],
      ),
      body: todos.isEmpty
          ? const Center(child: Text("Empty ~ Add Todo"))
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return Dismissible(
                  key: Key(todo.title + index.toString()), // unique key
                  direction:
                      DismissDirection.endToStart, // swipe from right to left
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      todos.removeAt(index);
                    });
                    saveTodos();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Todo deleted')),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.all(10),
                    color: Colors.blueGrey,
                    child: ListTile(
                      title: Text(
                        todo.title,
                        style: TextStyle(
                          decoration: todo.isCompleted
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      subtitle: Text(todo.description),
                      leading: Checkbox(
                        value: todo.isCompleted,
                        onChanged: (_) {
                          setState(() {
                            todo.isCompleted = !todo.isCompleted;
                          });
                          saveTodos();
                        },
                      ),
                      // trailing: IconButton(
                      //   icon: const Icon(Icons.delete, color: Colors.red),
                      //   onPressed: () {
                      //     setState(() {
                      //       todos.removeAt(index);
                      //     });
                      //     saveTodos();
                      //   },
                      // ),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTodo,
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}
