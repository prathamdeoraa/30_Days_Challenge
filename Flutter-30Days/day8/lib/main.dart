import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Homepage(), debugShowCheckedModeBanner: false);
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),

        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          title: Text(
            "Flutter_DAY-8",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),

          backgroundColor: Colors.blue,
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: 100,
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstPage()),
                ),
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),

              child: Text("List View"),
            ),
          ),
          SizedBox(height: 10),

          Container(
            width: 100,
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage()),
                ),
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),

              child: Text("Grid View"),
            ),
          ),
        ],
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  FirstPage({super.key});
  final List<String> items = ["Apple", "Banana", "Mango", "Orange", "Grapes"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView Example")),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.food_bank),
            title: Text(items[index]),
            trailing: Icon(Icons.arrow_forward),
          );
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  SecondPage({super.key});

  final List<String> items = ["Apple", "Banana", "Mango", "Orange", "Grapes"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView Example")),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.blueAccent,
            child: Center(
              child: Text(
                "Item ${index + 1}",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          );
        },
      ),
    );
  }
}
