import 'package:firebase/Uihelper/UiHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text('Reset Password'),
      ),

      body: Column(
        children: [
          SizedBox(height: media.height * 0.2),
          UiHelper.CustomField(_email, Icon(Icons.email), 'Email', false),
          UiHelper.CustomButton(
            () {
              reset();
            },
            "Reset Password",
            media.width * 0.6,
          ),
        ],
      ),
    );
  }

  Future<void> reset() async {
    await Future.delayed(
      const Duration(milliseconds: 500)
    );

    if (_email.text.isEmpty) {
      UiHelper.AlerBox(context, 'Enter Email');
    } else {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _email.text.trim(),
        );
        UiHelper.AlerBox(
          context,
          "Reset password mail has been sent to you mail",
        );
      } on FirebaseAuthException catch (ex) {
        UiHelper.AlerBox(context, ex.code.toString());
      }
    }
  }
}
