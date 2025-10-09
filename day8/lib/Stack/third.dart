import 'package:flutter/material.dart';

class ProfileStack extends StatefulWidget {
  const ProfileStack({super.key});

  @override
  State<ProfileStack> createState() => _ProfileStackState();
}

class _ProfileStackState extends State<ProfileStack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[400],
        title: Text(
          "Profile Stack",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),

      body: Center(
        child: Stack(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('https://picsum.photos/200'),
              radius: 50,
            ),
        
            Positioned(
              bottom: 5,
              right: 5,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
