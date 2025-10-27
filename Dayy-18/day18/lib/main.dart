import 'package:day18/Screens/AddNotes.dart';
import 'package:day18/Screens/Notespage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (context) => Notespage(), '/add': (context) => Addnotes()},
    );
  }
}
