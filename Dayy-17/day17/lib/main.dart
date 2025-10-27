import 'screen/todopage.dart';
import 'package:flutter/material.dart';

import 'screen/addItem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (context) => Homepage(), '/add': (context) => AddTodo()},
    );
  }
}

/*

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do App (Shared Pref)',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TodoApp(),
    );
  }
}

class TodoApp extends StatefulWidget {
  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<Map<String, dynamic>> todos = [];
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadTodos(); // Load saved todos
  }

  // Load todos from SharedPreferences
  Future<void> loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final String? todoString = prefs.getString('todos');
    if (todoString != null) {
      setState(() {
        todos = List<Map<String, dynamic>>.from(json.decode(todoString));
      });
    }
  }

  // Save todos to SharedPreferences
  Future<void> saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('todos', json.encode(todos));
  }

  void addTodo() {
    if (controller.text.trim().isEmpty) return;
    setState(() {
      todos.add({'title': controller.text.trim(), 'isCompleted': false});
      controller.clear();
    });
    saveTodos();
  }

  void toggleTodoStatus(int index) {
    setState(() {
      todos[index]['isCompleted'] = !todos[index]['isCompleted'];
    });
    saveTodos();
  }

  void deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
    saveTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My To-Do List")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter task...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: addTodo, child: const Text("Add")),
              ],
            ),
          ),
          Expanded(
            child: todos.isEmpty
                ? const Center(child: Text("No tasks yet 📝"))
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
                            onChanged: (_) => toggleTodoStatus(index),
                          ),
                          title: Text(
                            todo['title'],
                            style: TextStyle(
                              decoration: todo['isCompleted']
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => deleteTodo(index),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
*/
