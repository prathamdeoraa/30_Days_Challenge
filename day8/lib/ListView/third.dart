import 'package:flutter/material.dart';

class ListSeperator extends StatefulWidget {
  const ListSeperator({super.key});

  @override
  State<ListSeperator> createState() => _ListSeperatorState();
}

class _ListSeperatorState extends State<ListSeperator> {
  final List<String> names = ['Pratham', 'Jhon', 'ram', 'shyam', 'max'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: Text(
          "ListView Seperator",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      // ListView Seperated Widget ------------------------------->
      body: ListView.separated(
        itemCount: names.length,
        itemBuilder: (BuildContext context, index) {
          return ListTile(
            leading: Icon(Icons.calendar_view_day_rounded),
            title: Text("${names[index]}"),
          );
        },
        separatorBuilder: (context, index) => Divider(color: Colors.red),
      ),
    );
  }
}
