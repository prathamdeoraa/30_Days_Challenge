import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  void navigatetoAddTodo() {
    Navigator.pushNamed(context, "/edit");
  }

  Future<void> _refresh() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TODO LIST", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black45,
      ),

      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView.builder(itemBuilder: (context, index) {}),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigatetoAddTodo,
        label: Text("Add Todo"),
        backgroundColor: Colors.blue[900],
      ),
    );
  }
}
