import 'package:firebase/Uihelper/UiHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passcontroller = TextEditingController();

  bool _isLoading = false; // 👈 track loading state

  Future<void> getData(String email, String pass) async {
    if (email.isEmpty || pass.isEmpty) {
      UiHelper.AlerBox(context, 'Please fill all fields');
      return;
    }

    setState(() {
      _isLoading = true; // 👈 start loading
    });

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass)
          .then((usercred) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/dashboard',
              (route) => false,
            );
          });
    } on FirebaseAuthException catch (ex) {
      UiHelper.AlerBox(context, ex.message ?? ex.code);
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false; // 👈 stop loading
        });
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
          "Signup PAGE",
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

            _isLoading
                ? const CircularProgressIndicator() // 👈 show loader
                : UiHelper.CustomButton(
                    () {
                      getData(
                        _emailcontroller.text.trim(),
                        _passcontroller.text.trim(),
                      );
                    },
                    "SignUp",
                    media.width * 0.8,
                  ),
            SizedBox(height: 30),

            Row(
              mainAxisSize: MainAxisSize.min,

              children: [
                Text("Alredy have an Account,", style: TextStyle(fontSize: 15)),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/',
                      (route) => false,
                    );
                  },
                  child: Text(
                    "Login",
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
