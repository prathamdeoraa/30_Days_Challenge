import 'package:flutter/material.dart';

class ListTileApp extends StatefulWidget {
  const ListTileApp({super.key});

  @override
  State<ListTileApp> createState() => _ListTileAppState();
}

class _ListTileAppState extends State<ListTileApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        title: Text(
          "List Tile",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),

      body: ListTile(
        leading: Icon(Icons.person, color: Colors.blue),
        title: Text('John Doe'),
        subtitle: Text('Software Engineer'),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          print('Tile tapped!');
        },
      ),
    );
  }
}
