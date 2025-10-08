import 'package:flutter/material.dart';

class ListSnackBar extends StatefulWidget {
  const ListSnackBar({super.key});

  @override
  State<ListSnackBar> createState() => _ListSnackBarState();
}

class _ListSnackBarState extends State<ListSnackBar> {
    final List<String> names = ['Pratham', 'Jhon', 'ram', 'shyam', 'max'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: Text("ListView Snackbar", style: TextStyle(fontWeight: FontWeight.bold)),
      ),

      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Icon(Icons.menu)),
            title: Text(names[index]),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('You tapped on ${names[index]}'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          );
        },
      ),


    );
  }
}
