import 'package:flutter/material.dart';

class MiniProjectPage extends StatefulWidget {
  const MiniProjectPage({super.key});

  @override
  State<MiniProjectPage> createState() => _MiniProjectPageState();
}

class _MiniProjectPageState extends State<MiniProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mini Project Example")),
      body: const Center(child: Text("This is Mini Project Page")),
    );

  }
}