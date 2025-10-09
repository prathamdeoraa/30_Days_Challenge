import 'package:day8/ListView/First.dart';
import 'package:day8/ListView/Second.dart';
import 'package:day8/ListView/four.dart';
import 'package:day8/ListView/third.dart';
import 'package:flutter/material.dart';

class ListViewApp extends StatefulWidget {
  const ListViewApp({super.key});

  @override
  State<ListViewApp> createState() => _ListViewAppState();
}

class _ListViewAppState extends State<ListViewApp> {
  final List<String> names = ['John', 'Emma', 'Alex', 'Mia', 'Sophia', 'Liam'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: Text("ListView", style: TextStyle(fontWeight: FontWeight.bold)),
      ),



      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListViewNormal()),
                );
              },
              child: Text("ListView Normal"),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListViewHorizontal()),
                );
              },
              child: Text("ListView Horizontal"),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListSeperator()),
                );
              },
              child: Text("ListView Seperator"),
            ),

            TextButton(
              
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListSnackBar()),
                );
              },
              child: Text("ListView SnackBar"),
            ),
          ],
        ),
      ),
    );
  }
}
