import 'package:day17/model.dart/todovalue.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  List<Todovalue> todos = [];

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadTodos();
  }

  void reset() {
    _titleController.clear();
    _descController.clear();
  }

  void submit() async {
    if (_titleController.text.isEmpty || _descController.text.isEmpty) return;

    final prefs = await SharedPreferences.getInstance();
    final String? todoString = prefs.getString('todos');

    List<Todovalue> existingTodos = [];
    if (todoString != null) {
      existingTodos = Todovalue.decode(todoString);
    }

    final newTodo = Todovalue(
      title: _titleController.text,
      description: _descController.text,
      isCompleted: false,
    );

    existingTodos.add(newTodo);
    await prefs.setString('todos', Todovalue.encode(existingTodos));

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Todo added successfully!')));

    Navigator.pop(context); // go back to homepage

    print('Title: ${_titleController.text}, Description: ${_descController.text}');

  }

  void loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final String? todoString = prefs.getString('todos');
    if (todoString != null) {
      setState(() {
        todos = Todovalue.decode(todoString);
      });
    }
  }

  void saveTodos() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('todos', Todovalue.encode(todos));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text("Add Item"),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: _titleController,
              style: const TextStyle(fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: "Title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: _descController,
              decoration: InputDecoration(
                hintText: "Description",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              maxLines: 8,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  foregroundColor: Colors.black,
                  fixedSize: Size(MediaQuery.sizeOf(context).width * 0.4, 40),
                ),
                child: const Text("Submit"),
              ),
              ElevatedButton(
                onPressed: reset,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  fixedSize: Size(MediaQuery.sizeOf(context).width * 0.4, 40),
                ),
                child: const Text("Reset"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
