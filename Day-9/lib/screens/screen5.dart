import 'package:flutter/material.dart';

class RadioButtonPage extends StatefulWidget {
  const RadioButtonPage({super.key});

  @override
  State<RadioButtonPage> createState() => _RadioButtonPageState();
}

class _RadioButtonPageState extends State<RadioButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Radio Button Example")),
      body: const Center(child: Text("This is Radio Button Page")),
    );
  }
}