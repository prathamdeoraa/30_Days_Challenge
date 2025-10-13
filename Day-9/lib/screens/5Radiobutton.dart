/*
 RadioListTile is Deprecated
 so we can use RadioGroup<>(),
 
*/

import 'package:flutter/material.dart';

class RadioButtonPage extends StatefulWidget {
  const RadioButtonPage({super.key});

  @override
  State<RadioButtonPage> createState() => _RadioButtonPageState();
}

class _RadioButtonPageState extends State<RadioButtonPage> {
  String selectedGender = "male";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Radio Button Example")),

      body: RadioGroup<String>(
        groupValue: selectedGender,
        onChanged: (value) {
          setState(() {
            selectedGender = value!;
            // print("$value");
          });
        },

        child: Column(
          children: [
            Row(
              children: [
                Radio<String>(value: 'male'),
                Text("Male"),
              ],
            ),
            Row(
              children: [
                Radio<String>(value: 'female'),
                Text("FeMale"),
              ],
            ),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('Selected Gender: $selectedGender');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('You selected: $selectedGender')),
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
