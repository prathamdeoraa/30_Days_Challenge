import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  void logout() {
    Navigator.pop(context);
  }

  void settings() {
    Navigator.pushNamed(context, "/Third");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text(
          "DashBoard",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              onPressed: () {
                logout();
              },
              icon: Icon(Icons.logout, color: Colors.white),
            ),
          ),
        ],
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("This is Dashboard Page,")],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => settings(),
        child: Icon(Icons.settings),
      ),
    );
  }
}
