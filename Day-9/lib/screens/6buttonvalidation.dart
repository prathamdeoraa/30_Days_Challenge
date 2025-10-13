import 'package:flutter/material.dart';

class ValidationPage extends StatefulWidget {
  const ValidationPage({super.key});

  @override
  State<ValidationPage> createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Validation Example")),
      body: Center(
        child: Column(
          children: [
            Text("We have done it in :"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("TextFormField"),
            ),
          ],
        ),
      ),
    );
  }
}
