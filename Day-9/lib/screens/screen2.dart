import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldPage extends StatefulWidget {
  const TextFormFieldPage({super.key});

  @override
  State<TextFormFieldPage> createState() => _TextFormFieldPageState();
}

class _TextFormFieldPageState extends State<TextFormFieldPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailcontrol = TextEditingController();
  final _password = TextEditingController();
  final _phoneno = TextEditingController();

  final bool _obscure = true;

  void _login() {
    if (_formKey.currentState!.validate()) {
      // Print to console
      print('Email: ${_emailcontrol.text}');
      print('Password: ${_password.text}');
      print('Phone no: ${_phoneno.text}');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login Successful')));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailcontrol.dispose();
    _password.dispose();
    _phoneno.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Text Form Field Example")),

      body: SingleChildScrollView(
        child: Form(
          key: _formKey,

          child: Container(
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                TextFormField(
                  controller: _emailcontrol,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "email",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autofillHints: [AutofillHints.email],
                  onTap: () {},
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Required";
                    if (!value.contains("@gmail.com")) return "wrong input";
                    return null;
                  },
                ),

                SizedBox(height: 20),

                TextFormField(
                  controller: _password,
                  obscureText: _obscure,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    labelText: "Password",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "password cannot be empty";
                    } else if (value.length <= 7)
                      return "password should more than 7char";
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  onTap: () {},
                ),

                SizedBox(height: 20),
                TextFormField(
                  controller: _phoneno,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: "Phone Number",
                    border: OutlineInputBorder(),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  onTap: () {},
                ),

                SizedBox(height: 20),

                TextField(
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: 6, // or null for unlimited
                  decoration: InputDecoration(
                    labelText: 'Bio',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          _login();
                          _emailcontrol.clear();
                          _password.clear();
                          _phoneno.clear();
                          // dispose();
                        },
                        child: Text("SUBMIT"),
                      ),
                    ),

                    SizedBox(
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          _emailcontrol.clear();
                          _password.clear();
                          _phoneno.clear();
                        },
                        child: Text("Reset"),
                      ),
                    ),
                  ],
                ),
                TextField(
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  cursorWidth: 10,
                  cursorRadius: Radius.circular(2),
                  cursorColor: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
