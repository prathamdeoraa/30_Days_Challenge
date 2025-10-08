import 'package:day8/Widgets/button1.dart';
import 'package:day8/Widgets/button2.dart';
import 'package:day8/Widgets/button3.dart';
import 'package:day8/Widgets/button4.dart';
import 'package:day8/Widgets/button5.dart';
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
      routes: {
        '/': (context) => HomePage(),
        '/button1': (context) => ListViewApp(),
        '/button2': (context) => GridViewApp(),
        '/button3': (context) => StackApp(),
        '/button4': (context) => CardApp(),
        '/button5': (context) => MiniChallengeApp(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of buttons with text and routes
    final buttons = [
      {'text': 'ListView', 'route': '/button1'},
      {'text': 'GridView', 'route': '/button2'},
      {'text': 'Stack', 'route': '/button3'},
      {'text': 'Card', 'route': '/button4'},
      {'text': 'MiniChallenge', 'route': '/button5'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("DAY_8",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
      ),

      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 50),
        itemCount: buttons.length,
        itemBuilder: (context, index) {
          return buildFAB(context, buttons[index]['text']!, buttons[index]['route']!, index);
        },
      ),
    );
  }

  Widget buildFAB(BuildContext context, String text, String route, int index) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
    child: SizedBox(
      width: double.infinity,  // makes button full width inside padding
      height: 100,               // custom height
      child: FloatingActionButton.extended(
        heroTag: 'fab$index',
        onPressed: () => Navigator.pushNamed(context, route),
        label: Text(
          text,
          style: TextStyle(fontSize: 18),
        ),
        backgroundColor: Colors.amberAccent,
      ),
    ),
  );
}

}










// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'secondPage.dart';

// void main() {
//   runApp(
//     MaterialApp(home: SimpleLoginPage(), debugShowCheckedModeBanner: false),
//   );
// }

// class SimpleLoginPage extends StatefulWidget {
//   @override
//   _SimpleLoginPageState createState() => _SimpleLoginPageState();
// }

// class _SimpleLoginPageState extends State<SimpleLoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   String email = '';
//   String password = '';
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   void _login() {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save(); // Save the input values
//       print('Email: $email');
//       print('Password: $password');
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text('Login Successful!')));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,

//       // resizeToAvoidBottomInset: true,

//       // appBar: AppBar(title: Text('Login Page',style: TextStyle(fontWeight: FontWeight.bold),), centerTitle: false),
//       appBar: AppBar(
//         title: Text(
//           "MyApp",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Colors.black,
//         centerTitle: false,
        
//         shape: Border(
//           bottom: BorderSide(
//             color: Colors.white, // border color
//             width: 2.0, // border width
//           ),
//         ),


//         // second method of undeline dividing the app bar
//         // elevation: 1,
//         // shadowColor: Colors.white,

//         actions: [
//           IconButton(onPressed: () => {}, icon: Icon(Icons.menu,color: Colors.white,))
//         ],
//       ),

//       body: Center(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   Text(
//                     "Login Form",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 50,
//                       color: Colors.white,
//                     ),
//                   ),

//                   SizedBox(height: 40),

//                   // Email Fieldq
//                   TextFormField(
//                     controller: _emailController,
//                     decoration: InputDecoration(
//                       labelText: 'Email',
//                       border: OutlineInputBorder(),
//                     ),
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter email';
//                       } else if (!value.contains('@gmail.com')) {
//                         return 'Enter valid email';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) => email = value!,
//                   ),
//                   SizedBox(height: 20),

//                   // Password Field
//                   TextFormField(
//                     controller: _passwordController,
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       border: OutlineInputBorder(),
//                     ),
//                     obscureText: true,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter password';
//                       } else if (value.length < 6) {
//                         return 'Password too short';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) => password = value!,
//                   ),
//                   SizedBox(height: 30),

//                   // Login Button
//                   ElevatedButton(
//                     onPressed: () {
//                       setState(() {
//                         _login();
//                         _emailController.clear();
//                         _passwordController.clear();
//                       });
//                     },
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: Size(double.infinity, 50),
//                     ),
//                     child: Text('Login', style: TextStyle(fontSize: 18)),
//                   ),

//                   SizedBox(height: 30),

//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => LoginPage()),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: Size(double.infinity, 50),
//                     ),
//                     child: Text(
//                       'GO TO NEXT PAGE',
//                       style: TextStyle(fontSize: 18),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
