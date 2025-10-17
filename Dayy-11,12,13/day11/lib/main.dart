import 'package:day11/screens/dashboard.dart';
import 'package:day11/screens/Login.dart';
import 'package:day11/screens/settings.dart';
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
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => Homepage(),
        '/second': (context) => DashboardPage(),
        '/Third': (context) => SettingPage(),
      },
    );
  }
}
