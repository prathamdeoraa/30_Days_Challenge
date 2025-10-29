import 'package:firebase/screens/DashBoard.dart';
import 'package:firebase/screens/LoginPage.dart';
import 'package:firebase/screens/SignUpPage.dart';
import 'package:firebase/services/CheckUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseAuth.instance.setLanguageCode('en');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase',
      debugShowCheckedModeBanner: false,
      initialRoute: '/checkuser',
      routes: {
        '/': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/dashboard': (context) => const Dashboard(),
        '/checkuser': (context) => const CheckUser(),
      },
    );
  }
}
