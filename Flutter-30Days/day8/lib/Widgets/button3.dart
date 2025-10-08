import 'package:day8/Stack/first.dart';
import 'package:day8/Stack/four.dart';
import 'package:day8/Stack/second.dart';
import 'package:day8/Stack/third.dart';
import 'package:flutter/material.dart';

class StackApp extends StatefulWidget {
  const StackApp({super.key});

  @override
  State<StackApp> createState() => _StackAppState();
}

class _StackAppState extends State<StackApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[600],
        title: Text(
          "Stack Concept",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black,
          ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.yellow, Colors.purple],
                ),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SimpleStack()),
                  );
                },
                child: Text(
                  "Simple Stack",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.yellow, Colors.purple],
                ),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PositionStack()),
                  );
                },
                child: Text(
                  "Positioned Items in Stack",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.yellow, Colors.purple],
                ),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileStack()),
                  );
                },
                child: Text(
                  "Profile Picture with Badge",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.yellow, Colors.purple],
                ),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScaffoldStack()),
                  );
                },
                child: Text(
                  "Stack insdie Scaffold",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
