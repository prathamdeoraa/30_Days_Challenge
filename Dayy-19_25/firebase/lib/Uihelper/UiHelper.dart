import 'package:flutter/material.dart';

class UiHelper {
  static Padding CustomField(
    TextEditingController controller,
    Icon icons,
    String text,
    bool obscure,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          suffix: icons,
          hintText: text,
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 30),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        obscureText: obscure,
      ),
    );
  }

  static ElevatedButton CustomButton(
    VoidCallback voidcallback,
    String text,
    double width,
  ) {
    return ElevatedButton(
      onPressed: () {
        voidcallback();
      },
      style: ElevatedButton.styleFrom(backgroundColor: Colors.lightBlueAccent),
      child: SizedBox(
        height: 40,
        width: width,

        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 25),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  static Future AlerBox(BuildContext context, String text) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
