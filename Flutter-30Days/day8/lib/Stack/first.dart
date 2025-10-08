import 'package:flutter/material.dart';

class SimpleStack extends StatefulWidget {
  const SimpleStack({super.key});

  @override
  State<SimpleStack> createState() => _SimpleStackState();
}

class _SimpleStackState extends State<SimpleStack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text(
          "Simple Stack",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    
      body: Stack(

        children: [
          Image.network(
            'https://picsum.photos/400/250',
            fit: BoxFit.cover,
            height: 250,
            width: double.infinity,
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.only(left: 3),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black54, Colors.black54],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Beautiful Nature',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
