import 'package:flutter/material.dart';

class ScaffoldStack extends StatefulWidget {
  const ScaffoldStack({super.key});

  @override
  State<ScaffoldStack> createState() => _ScaffoldStackState();
}

class _ScaffoldStackState extends State<ScaffoldStack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        title: Text(
          "Stack inside Scaffold",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(height: 200, width: 200, color: Colors.pink[100]),
            Container(height: 150, width: 150, color: Colors.pink[200]),
            Container(height: 100, width: 100, color: Colors.pink[400]),
            Text(
              'Overlay',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            
          ],
        ),
      ),
    );

    // Scaffold(
    // appBar: AppBar(
    //   backgroundColor: Colors.pink[100],
    //   title: Text(
    //     "Stack inside Scaffold",
    //     style: TextStyle(
    //       color: Colors.black,
    //       fontWeight: FontWeight.bold,
    //       fontSize: 20,
    //     ),
    //   ),
    // ),
    // );
  }
}
