// import 'package:day8/main.dart';
// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//     LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.yellow, Colors.purple],
//               // begin: Alignment.topLeft,
//               // end: Alignment.topRight,
//             ),
//           ),
//         ),

//         backgroundColor: Colors.amberAccent,
//         title: Text(
//           "Login Form",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//         actions: [
//           PopupMenuButton<String>(
//             onSelected: (value) {
//               // Runs when an option is selected
//               print("Selected: $value");

//               if (value == "Option 1") {
//                 // Navigate to another page
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SimpleLoginPage()),
//                 );
//               } else if (value == "Option 2") {
//                 Navigator.pop(context);
//               }
//             },
//             itemBuilder: (BuildContext context) {
//               return [
//                 const PopupMenuItem(value: "Option 1", child: Text("push")),
//                 const PopupMenuItem(value: "Option 2", child: Text("pop")),
//               ];
//             },
//           ),
//         ],

//         // automaticallyImplyLeading: false,
//         centerTitle: true,
//       ),
//     );
//   }
// }
