import 'package:flutter/material.dart';

class PositionStack extends StatefulWidget {
  const PositionStack({super.key});

  @override
  State<PositionStack> createState() => _PositionStackState();
}

class _PositionStackState extends State<PositionStack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[400],
        title: Text(
          "Positioned Stack",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey,
          ),

          Positioned(
            top: 30,
            left: 20,
            child: Text(
              "Top Left",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),

          Positioned(
            bottom: 50,
            right: 30,
            child: ElevatedButton(
              onPressed: () => print("Button Pressed!!"),
              child: Text("Click "),
            ),
          ),
        ],
      ),
    );
  }
}
