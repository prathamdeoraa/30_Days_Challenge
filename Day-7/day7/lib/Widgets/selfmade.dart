import 'package:flutter/material.dart';

class selfmade extends StatelessWidget {
  const selfmade({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, color: Colors.white),

        backgroundColor: Colors.redAccent,

        title: Text(
          "30-Days Challenge",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        children: [
          Container(
            width: 300,
            margin: EdgeInsets.symmetric(horizontal: 50, vertical: 40),
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withValues(alpha: 1),
                  blurRadius: 10,
                  offset: Offset(0, 0),
                ),
              ],
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,

              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    "https://i.pravatar.cc/150?img=3/",
                  ),
                ),

                SizedBox(height: 20),
                Text(
                  'Pratham Deora',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 10),

                Text(
                  'Flutter Developer | Cybersecurity Enthusiast',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),

                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email, color: Colors.blue),
                    SizedBox(width: 15),
                    Icon(Icons.phone, color: Colors.green),
                  ],
                ),
              ],
            ),
          ),

          Text(
            "DAY - 7 Flutter",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          Text(
            " - Avatar, \n - Container,\n - made an Profile Grid (above). ",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
