import 'package:flutter/material.dart';
import 'view/imp_exp.dart';

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
      initialRoute: '/splashscreen',
      routes: {
        '/': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/dashboard': (context) => const Dashboard(),
        '/checkuser': (context) => const CheckUser(),
        '/resetpass': (context) => const ResetPassword(),
        '/phone': (context) => const Phonepage(),
        '/database1': (context) => const ShowData(),
        '/splashscreen': (context) => const SplashScreen(),
      },
    );
  }
}
