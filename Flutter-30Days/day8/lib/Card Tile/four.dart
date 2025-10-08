import 'package:flutter/material.dart';

class MultipleListCard extends StatefulWidget {
  const MultipleListCard({super.key});

  @override
  State<MultipleListCard> createState() => _MultipleListCardState();
}

class _MultipleListCardState extends State<MultipleListCard> {
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
      
      body: ListView(
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.laptop),
              title: Text('Laptop'),
              subtitle: Text('Price: ₹50,000'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.phone_android),
              title: Text('Smartphone'),
              subtitle: Text('Price: ₹20,000'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.headphones),
              title: Text('Headphones'),
              subtitle: Text('Price: ₹2,000'),
            ),
          ),
        ],
      ),
    );
  }
}
