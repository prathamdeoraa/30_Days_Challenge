import 'package:flutter/material.dart';

class GridViewBuilder extends StatefulWidget {
  const GridViewBuilder({super.key});

  @override
  State<GridViewBuilder> createState() => _GridViewBuilderState();
}

class _GridViewBuilderState extends State<GridViewBuilder> {
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
          "Grid View Builder",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          // mainAxisExtent: 100,
        ),
        
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.network(images[index], fit: BoxFit.cover);
        },
      ),
    );
  }
}
