import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(home: DropdownExample(), debugShowCheckedModeBanner: false),
);

class DropdownExample extends StatefulWidget {
  const DropdownExample({super.key});

  @override
  _DropdownExampleState createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String? selectedCity; // Holds the selected city
  List<String> cities = ['Mumbai', 'Delhi', 'Pune', 'Bangalore'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DropdownButton Example')),

      body: Center(
        child: DropdownButton<String>(
          hint: Text("Selext City"),
          value: selectedCity,
          onChanged: (String? newValue) {
            setState(() {
              selectedCity = newValue;
            });
          },
          items: cities.map((city) {
            return DropdownMenuItem(value: city, child: Text(city));
          }).toList(),
        ),
      ),
    );
  }
}
