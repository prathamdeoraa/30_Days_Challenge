import 'package:flutter/material.dart';

class MiniProjectPage extends StatefulWidget {
  const MiniProjectPage({super.key});

  @override
  State<MiniProjectPage> createState() => _MiniProjectPageState();
}

class _MiniProjectPageState extends State<MiniProjectPage> {
  final _emailcontroller = TextEditingController();
  final _passcontroller = TextEditingController();
  final _globalkey = GlobalKey<FormState>();

  void _logic() {
    print("your email is:${_emailcontroller.text}");
    print("your Password is:${_passcontroller.text}");
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Login Successfull!!")));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailcontroller.dispose();
    _passcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mini Project Example",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _globalkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "email",
                  hintText: "abc@gmail.com",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Password cannot be empty';
                  if (!value.contains("@gmail")) return 'Incorrext email';
                  return null;
                },
              ),

              SizedBox(height: 20),

              TextFormField(
                controller: _passcontroller,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return "Password cannot be empty";
                  if (value.length < 6) 
                    return "Length should greater than 6";
                },
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () => {
                  setState(() {
                    _logic();
                    _emailcontroller.clear();
                    _passcontroller.clear();
                  }),
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class _MiniProjectPageState extends State<MiniProjectPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   void _login() {
//     if (_formKey.currentState!.validate()) {
//       // Print to console
//       print('Email: ${_emailController.text}');
//       print('Password: ${_passwordController.text}');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Login Successful')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login Form'),
//         centerTitle: true,
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 controller: _emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty)
//                     return 'Email cannot be empty';
//                   if (!value.contains('@'))
//                     return 'Please enter a valid email';
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 controller: _passwordController,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                 ),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty)
//                     return 'Password cannot be empty';
//                   if (value.length < 6)
//                     return 'Password must be at least 6 characters';
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _login,
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(vertical: 14),
//                   backgroundColor: Colors.blueAccent,
//                 ),
//                 child: Text('Login', style: TextStyle(fontSize: 18)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
