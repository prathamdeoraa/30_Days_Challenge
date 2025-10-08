import 'package:flutter/material.dart';

class CardTileApp extends StatefulWidget {
  const CardTileApp({super.key});

  @override
  State<CardTileApp> createState() => _CardTileAppState();
}

class _CardTileAppState extends State<CardTileApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        title: Text(
          "Card",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),

      body: Card(
        elevation: 5, // shadow depth
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text('This is a simple card!', style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
