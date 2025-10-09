import 'package:day9/screens/1.%20TextField/screen1.dart';
import 'package:day9/screens/screen2.dart';
import 'package:day9/screens/screen3.dart';
import 'package:day9/screens/screen4.dart';
import 'package:day9/screens/screen5.dart';
import 'package:day9/screens/screen6.dart';
import 'package:day9/screens/screen7.dart';
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
      title: 'Login Form',
      routes: {
        '/': (context) => MyHomePage(),
        '/second': (context) => TextFieldPage(),
        '/third': (context) => TextFormFieldPage(),
        '/fourth': (context) => DropdownExample(),
        '/fifth': (context) => CheckBoxPage(),
        '/sixth': (context) => RadioButtonPage(),
        '/seventh': (context) => ValidationPage(),
        '/eighth': (context) => MiniProjectPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of button names and destination pages
    final List<Map<String, dynamic>> buttonData = [
      {"title": "Text Field", "page": TextFieldPage()},
      {"title": "Text Form Field", "page": TextFormFieldPage()},
      {"title": "Drop Down Button", "page": DropdownExample()},
      {"title": "Check Box", "page": CheckBoxPage()},
      {"title": "Radio Button", "page": RadioButtonPage()},
      {"title": "Button Validation Example", "page": ValidationPage()},
      {"title": "Mini Project", "page": MiniProjectPage()},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("DAY _9"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: buttonData.length,
        itemBuilder: (context, index) {
          final item = buttonData[index];
          return GradientButton(
            title: item["title"],
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => item["page"]),
              );
            },
          );
        },
      ),
    );
  }
}

// 🌈 Reusable Gradient Button Widget
class GradientButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const GradientButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.yellow, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

//
// 🧩 Example destination pages
//


//---------------------->_----------------------IT gives ScreenPixel error

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       // theme: ThemeData(
//       //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       // ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.blueAccent, title: Text("data")),

//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Center(
//             child: Container(
//               margin: EdgeInsets.all(10),
//               // alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.yellow, Colors.purple],
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),

//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.transparent,
//                   shadowColor: Colors.transparent,
//                 ),
//                 onPressed: () {},
//                 child: Text(
//                   "Text Field",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           Center(
//             child: Container(
//               margin: EdgeInsets.all(10),
//               // alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.yellow, Colors.purple],
//                 ),
//                 borderRadius: BorderRadius.circular(30),
//               ),

//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.transparent,
//                   shadowColor: Colors.transparent,
//                 ),
//                 onPressed: () {},
//                 child: Text(
//                   "Text Form Field",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//           ),

//                 Center(
//             child: Container(
//               margin: EdgeInsets.all(10),
//               // alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [Colors.yellow, Colors.purple]),
//                 borderRadius: BorderRadius.circular(30)
//               ),
            
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.transparent,
//                   shadowColor: Colors.transparent,
//                 ),
//                 onPressed: () {},
//                 child: Text(
//                   "Drop Down Button",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//           ),

//                 Center(
//             child: Container(
//               margin: EdgeInsets.all(10),
//               // alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [Colors.yellow, Colors.purple]),
//                 borderRadius: BorderRadius.circular(30)
//               ),
            
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.transparent,
//                   shadowColor: Colors.transparent,
//                 ),
//                 onPressed: () {},
//                 child: Text(
//                   "Check Box",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//           ),

//                 Center(
//             child: Container(
//               margin: EdgeInsets.all(10),
//               // alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [Colors.yellow, Colors.purple]),
//                 borderRadius: BorderRadius.circular(30)
//               ),
            
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.transparent,
//                   shadowColor: Colors.transparent,
//                 ),
//                 onPressed: () {},
//                 child: Text(
//                   "Radio Button",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//           ),

//                 Center(
//             child: Container(
//               margin: EdgeInsets.all(10),
//               // alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [Colors.yellow, Colors.purple]),
//                 borderRadius: BorderRadius.circular(30)
//               ),
            
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.transparent,
//                   shadowColor: Colors.transparent,
//                 ),
//                 onPressed: () {},
//                 child: Text(
//                   "Button Validation Example",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//           ),

//                 Center(
//             child: Container(
//               margin: EdgeInsets.all(10),
//               // alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [Colors.yellow, Colors.purple]),
//                 borderRadius: BorderRadius.circular(30)
//               ),
            
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.transparent,
//                   shadowColor: Colors.transparent
//                 ),
//                 onPressed: () {},
//                 child: Text(
//                   "Mini Project",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }