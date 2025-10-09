import 'package:flutter/material.dart';

class GridViewExtent extends StatefulWidget {
  const GridViewExtent({super.key});

  @override
  State<GridViewExtent> createState() => _GridViewExtentState();
}

class _GridViewExtentState extends State<GridViewExtent> {
  List<String> images = [
    'https://picsum.photos/200/300',
    'https://picsum.photos/200/301',
    'https://picsum.photos/200/302',
    'https://picsum.photos/200/303',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Grid View Extent",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: GridView.extent(
        padding: EdgeInsets.all(8),
        maxCrossAxisExtent: 150,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: List.generate(100, (index) {
          return Container(
            color: Colors.blueGrey,
            child: Center(child: Text('Item ${index + 1}')),
          );
        }),
      ),
    );
  }
}
