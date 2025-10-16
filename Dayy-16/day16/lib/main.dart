import 'package:day16/screens/edit.dart';
import 'package:day16/screens/todo.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      initialRoute: '/todo',
      routes: {
        '/todo': (context) => TodoPage(),
        '/edit': (context) => EditPage(),
      },
    );
  }
}
