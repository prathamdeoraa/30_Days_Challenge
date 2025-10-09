import 'package:flutter/material.dart';

class DropDownButtonPage extends StatefulWidget {
  const DropDownButtonPage({super.key});

  @override
  State<DropDownButtonPage> createState() => _DropDownButtonPageState();
}

class _DropDownButtonPageState extends State<DropDownButtonPage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: const Text("Drop Down Button Example")),
      body: const Center(child: Text("This is DropDownButton Page")),
    );
  }
}