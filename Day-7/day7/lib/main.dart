import 'package:day7/Widgets/selfmade.dart';
import 'package:flutter/material.dart';
import 'Widgets/ProfileCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: selfmade(),
      // home: Profilecard(),

    );
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.amber,
//           title: Center(
//             child: Text(
//               "DATA",
//               style: TextStyle(color: Colors.black, fontSize: 30),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
