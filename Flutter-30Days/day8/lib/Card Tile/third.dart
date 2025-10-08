import 'package:flutter/material.dart';

class CardListTile extends StatefulWidget {
  const CardListTile({super.key});

  @override
  State<CardListTile> createState() => _CardListTileState();
}

class _CardListTileState extends State<CardListTile> {
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

      body: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage('https://picsum.photos/200'),
          ),
          title: Text('Flutter Developer'),
          subtitle: Text('Building beautiful UIs'),
          trailing: Icon(Icons.favorite_border),
          onTap: () {
            print('Card tapped!');
          },
        ),
      ),
    );
  }
}
