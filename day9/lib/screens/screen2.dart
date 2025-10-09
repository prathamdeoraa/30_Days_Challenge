import 'package:flutter/material.dart';

class TextFormFieldPage extends StatefulWidget {
  const TextFormFieldPage({super.key});

  @override
  State<TextFormFieldPage> createState() => _TextFormFieldPageState();
}

class _TextFormFieldPageState extends State<TextFormFieldPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailcontrol = TextEditingController();
  final _password = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Print to console
      print('Email: ${_emailcontrol.text}');
      print('Password: ${_password.text}');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login Successful')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Text Form Field Example")),

      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(decoration: InputDecoration(labelText: "email",),onTap: ,),
            SizedBox(height: 20),
            TextFormField(decoration: InputDecoration(labelText: "Password")),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () => _login(), child: Text("SUBMIT")),
          ],
        ),
      ),
    );
  }
}
