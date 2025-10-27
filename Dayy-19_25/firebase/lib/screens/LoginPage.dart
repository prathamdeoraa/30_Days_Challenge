import 'package:firebase/Uihelper/UiHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passcontroller = TextEditingController();

  getLogin(String email, String pass) async {
    if (email == "" && pass == "") {
      return UiHelper.AlerBox(context, "Enter Valid Fields");
    } else {
      try {
        UserCredential? usercred;
        usercred = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: pass)
            .then((value) {
               Navigator.pushNamedAndRemoveUntil(
                context,
                '/dashboard',
                (route) => false,
              );
            });
      } on FirebaseAuthException catch (ex) {
        UiHelper.AlerBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
        title: Text(
          "LOGIN PAGE",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),

      // SizedBox(height: 300),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),

            UiHelper.CustomField(
              _emailcontroller,
              Icon(Icons.mail),
              "Email",
              false,
            ),

            UiHelper.CustomField(
              _passcontroller,
              Icon(Icons.password),
              "Password",
              true,
            ),
            SizedBox(height: 30),

            UiHelper.CustomButton(
              () {
                getLogin(
                  _emailcontroller.text.toString(),
                  _passcontroller.text.toString(),
                );
              },
              "Login",
              media.width * 0.8,
            ),

            SizedBox(height: 30),

            Row(
              mainAxisSize: MainAxisSize.min,

              children: [
                Text(
                  "You don't have an Account,",
                  style: TextStyle(fontSize: 15),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: Text(
                    "SIGNUP",
                    style: TextStyle(fontSize: 15, color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
