// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       darkTheme: ThemeData.dark(),
//       home: Homepage(),
//     );
//   }
// }

// class Homepage extends StatelessWidget {
//   const Homepage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: const OfflineTodoApp(), // or HomeScreen(), etc.
    );
  }
}

class OfflineTodoApp extends StatefulWidget {
  const OfflineTodoApp({super.key});

  @override
  State<OfflineTodoApp> createState() => _OfflineTodoAppState();
}

class _OfflineTodoAppState extends State<OfflineTodoApp> {
  List<Map<String, dynamic>> todos = [];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTodos(); // Load on app start
  }

  // Load from SharedPreferences
  Future<void> _loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? savedList = prefs.getStringList('todos');
    if (savedList != null) {
      setState(() {
        todos = savedList
            .map((todoString) => jsonDecode(todoString))
            .cast<Map<String, dynamic>>()
            .toList();
      });
    }
  }

  // Save to SharedPreferences
  Future<void> _saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> stringList = todos
        .map((todo) => jsonEncode(todo))
        .toList();
    await prefs.setStringList('todos', stringList);
  }

  // Add new todo (replaces http.post)
  void _addTodo() {
    if (titleController.text.isEmpty || descController.text.isEmpty) return;

    setState(() {
      todos.add({
        'title': titleController.text.trim(),
        'description': descController.text.trim(),
        'isCompleted': false,
      });
    });

    _saveTodos();
    titleController.clear();
    descController.clear();
    Navigator.pop(context);
  }

  // Toggle completion
  void _toggleTodo(int index) {
    setState(() {
      todos[index]['isCompleted'] = !todos[index]['isCompleted'];
    });
    _saveTodos();
  }

  // Delete todo
  void _deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
    _saveTodos();
  }

  // Add Todo Dialog
  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Todo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(onPressed: _addTodo, child: const Text('Add')),
        ],
      ),
    );
  }

  // Clear all todos
  Future<void> _clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('todos');
    setState(() => todos = []);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Offline Todo App"),
          actions: [
            IconButton(
              onPressed: _clearAll,
              icon: const Icon(Icons.delete_forever),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _showAddDialog,
          child: const Icon(Icons.add),
        ),
        body: todos.isEmpty
            ? const Center(child: Text('No todos yet. Tap + to add.'))
            : ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    child: ListTile(
                      leading: Checkbox(
                        value: todo['isCompleted'],
                        onChanged: (_) => _toggleTodo(index),
                      ),
                      title: Text(
                        todo['title'],
                        style: TextStyle(
                          decoration: todo['isCompleted']
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      subtitle: Text(todo['description']),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteTodo(index),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
