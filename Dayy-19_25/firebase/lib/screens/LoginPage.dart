
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

  Future<void> getLogin(String email, String pass) async {
    await Future.delayed(const Duration(seconds: 5));

    if (email == "" && pass == "") {
      return UiHelper.AlerBox(context, "Enter Valid Fields");
    } else {
      try {
        UiHelper.AlerBox(context, 'Sometimes it takes time..');

        UserCredential? usercred;
        // FirebaseAuth.instance.setLanguageCode('en');
        // final start = DateTime.now();
        // await FirebaseAuth.instance.signInWithEmailAndPassword(
        //   email: email,
        //   password: pass,
        // );
        // print(
        //   'Login took: ${DateTime.now().difference(start).inSeconds} seconds',
        // );

        usercred = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: pass,
        );

        Navigator.pushNamedAndRemoveUntil(
          context,
          '/dashboard',
          (route) => false,
        );
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

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      //Todo
                      Navigator.pushNamed(context, '/phone');
                    },
                    icon: Icon(Icons.phone, color: Colors.white),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(left: 30),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    // borderRadius: BorderRadius.circular(30),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      //Todo
                    },
                    icon: Icon(Icons.facebook, color: Colors.white),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),
            Text('OR', style: TextStyle(fontWeight: FontWeight.bold)),

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
                  _emailcontroller.text.trim(),
                  _passcontroller.text.trim(),
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
                    "Signup",
                    style: TextStyle(fontSize: 15, color: Colors.blue[900]),
                  ),
                ),
              ],
            ),
            Text('OR', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              mainAxisSize: MainAxisSize.min,

              children: [
                Text("Forgot your password?", style: TextStyle(fontSize: 15)),
                TextButton(
                  onPressed: () {
                    //Todo
                    Navigator.pushNamed(context, '/resetpass');
                  },
                  child: Text(
                    "Reset",
                    style: TextStyle(fontSize: 15, color: Colors.blue[900]),
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
