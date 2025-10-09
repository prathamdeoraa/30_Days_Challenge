import 'package:flutter/material.dart';

class ListViewHorizontal extends StatefulWidget {
  const ListViewHorizontal({super.key});

  @override
  State<ListViewHorizontal> createState() => _ListViewHorizontalState();
}

class _ListViewHorizontalState extends State<ListViewHorizontal> {
  final List<String> names = ["sam", "max", "ram", "jon", "bon"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: Text(
          "ListView Horixontal",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,

                child: Container(
                  width: 100, // width of each item
                  margin: EdgeInsets.all(8),
                  color: Colors.blueAccent,
                  child: Center(
                    child: Text('Name: ${names[index]}', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
