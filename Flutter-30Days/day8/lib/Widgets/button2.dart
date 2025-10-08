import 'package:day8/GridView/first.dart';
import 'package:day8/GridView/second.dart';
import 'package:day8/GridView/third.dart';
import 'package:flutter/material.dart';

class GridViewApp extends StatefulWidget {
  const GridViewApp({super.key});

  @override
  State<GridViewApp> createState() => _GridViewAppState();
}

class _GridViewAppState extends State<GridViewApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: Text("Grid View", style: TextStyle(fontWeight: FontWeight.bold)),
      ),



      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.yellow,Colors.purple]),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GridViewCount()),
                  );
                },
                child: Text("GridView Count",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.yellow,Colors.purple]),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GridViewBuilder()),
                  );
                },
                child: Text("GridtView build",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.yellow,Colors.purple]),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GridViewExtent()),
                  );
                },
                child: Text("GridView extent",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
              ),
            ),

          
          ],
        ),
      ),
    );
  }
}
