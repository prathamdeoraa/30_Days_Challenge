import 'package:flutter/material.dart';

class GridViewCount extends StatefulWidget {
  const GridViewCount({super.key});

  @override
  State<GridViewCount> createState() => _GridViewCountState();
}

class _GridViewCountState extends State<GridViewCount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Grid View Count",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: EdgeInsets.all(10),
        children: [
          Container(
            color: Colors.red,
            child: Center(child: Text('1')),
          ),
          Container(
            color: Colors.green,
            child: Center(child: Text('2')),
          ),
          Container(
            color: Colors.blue,
            child: Center(child: Text('3')),
          ),
          Container(
            color: Colors.orange,
            child: Center(child: Text('4')),
          ),
        ],
      ),
    );
  }
}
