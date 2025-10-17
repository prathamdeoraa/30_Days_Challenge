import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final key = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();


  void login() {
    // print(email.text);
    // print(password.text);

    if (key.currentState!.validate()) {
      // If validation passes, navigate
      String username = email.text.trim();
      Navigator.pushNamed(context, '/second', arguments: username);
    }
    email.clear();
    password.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("Day _11"),
      ),

      body: Form(
        key: key,
        child: ListView(
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Login In",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      // label: Icon(Icons.email),
                      labelText: "email",
                      prefixIcon: Icon(Icons.email),
                      // prefixText: "Email: ",
                      hintText: "example@gmail.com",
                      border: OutlineInputBorder(),
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "enter valid email";
                      } else if (!value.contains('@')) {
                        return "Invalid Email";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 20),

                  TextFormField(
                    controller: password,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(Icons.password),
                      hintText: "example@gmail.com",
                      border: OutlineInputBorder(),
                      // errorText: "Enter valid Email",
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "enter valid password";
                      } else if (value.length <= 6) {
                        return "samll password";
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 20),

                  ElevatedButton(
                    onPressed: () {
                      login();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent, // button color
                      foregroundColor: Colors.white,

                      padding: EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5, // shadow depth
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
