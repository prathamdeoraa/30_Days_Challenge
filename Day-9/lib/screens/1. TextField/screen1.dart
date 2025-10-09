import 'package:flutter/material.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({super.key});

  @override
  State<TextFieldPage> createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  // final _emailController = TextEditingController();
  // final _passwordController = TextEditingController();
  // final _phoneController = TextEditingController();
  // final _nameController = TextEditingController();
  // bool _obscure = true;
  // final _passwordFocus = FocusNode();

  // @override
  // void initState() {
  //   super.initState();
  //   _nameController.addListener(() => setState(() {}));
  // }

  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   _phoneController.dispose();
  //   _nameController.dispose();
  //   _passwordFocus.dispose();
  //   super.dispose();
  // }

  // void _submit() {
  //   print('Email: ${_emailController.text}');
  //   print('Password: ${_passwordController.text}');
  //   print('Phone: ${_phoneController.text}');
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Check console for values')));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text("Text Field"),
      ),

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Name",
                  hintText: "Enter your name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email id",
                  hintText: "Enter your Email",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  hintText: "Password",
                  prefixText: "+91",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.numberWithOptions(),
              ),
              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 160,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(),
                      child: Text("Submit"),
                    ),
                  ),

                  SizedBox(
                    width: 160,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(),
                      child: Text("Reset"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // body: SingleChildScrollView(
      //   padding: EdgeInsets.all(16),
      //   child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      //     TextField(
      //       controller: _nameController,
      //       decoration: InputDecoration(
      //         labelText: 'Name',
      //         prefixIcon: Icon(Icons.person),
      //         suffixIcon: _nameController.text.isNotEmpty
      //             ? IconButton(onPressed: () => _nameController.clear(), icon: Icon(Icons.clear))
      //             : null,
      //         border: OutlineInputBorder(),
      //       ),
      //       textInputAction: TextInputAction.next,
      //       onSubmitted: (_) => FocusScope.of(context).nextFocus(),
      //     ),
      //     SizedBox(height: 12),
      //     TextField(
      //       controller: _emailController,
      //       decoration: InputDecoration(
      //         labelText: 'Email',
      //         prefixIcon: Icon(Icons.email),
      //         border: OutlineInputBorder(),
      //       ),
      //       keyboardType: TextInputType.emailAddress,
      //       textInputAction: TextInputAction.next,
      //       onSubmitted: (_) => FocusScope.of(context).requestFocus(_passwordFocus),
      //       autofillHints: [AutofillHints.email],
      //     ),
      //     SizedBox(height: 12),
      //     TextField(
      //       controller: _passwordController,
      //       focusNode: _passwordFocus,
      //       decoration: InputDecoration(
      //         labelText: 'Password',
      //         border: OutlineInputBorder(),
      //         suffixIcon: IconButton(
      //           icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
      //           onPressed: () => setState(() => _obscure = !_obscure),
      //         ),
      //       ),
      //       obscureText: _obscure,
      //       textInputAction: TextInputAction.done,
      //       onSubmitted: (_) => _submit(),
      //     ),
      //     SizedBox(height: 12),
      //     TextField(
      //       controller: _phoneController,
      //       decoration: InputDecoration(
      //         labelText: 'Phone',
      //         prefixText: '+91 ',
      //         border: OutlineInputBorder(),
      //       ),
      //       keyboardType: TextInputType.phone,
      //       // inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10)],
      //     ),
      //     SizedBox(height: 18),
      //     ElevatedButton(onPressed: _submit, child: Text('Submit')),
      //   ]),
      // ),
    );
  }
}
