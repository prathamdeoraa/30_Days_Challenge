import 'package:flutter/material.dart';

class MiniChallengeApp extends StatefulWidget {
  const MiniChallengeApp({super.key});

  @override
  State<MiniChallengeApp> createState() => _MiniChallengeAppState();
}

class _MiniChallengeAppState extends State<MiniChallengeApp> {
  final List<String> images = [
    'https://picsum.photos/200/300',
    'https://picsum.photos/200/301',
    'https://picsum.photos/200/302',
    'https://picsum.photos/200/303',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        title: Text(
          "Mini-Challenge",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),

      body: GridView.builder(
        
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),

        padding: EdgeInsets.all(10),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (index <= images.length) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('You tapped the image!')),
                );
              }
            },

            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(images[index], fit: BoxFit.cover),
                  ),
                ),

                Positioned(
                  bottom: 5,
                  left: 5,
                  child: Container(
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    child: Text(
                      'Image ${index + 1}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/*
              ✅ Task:
              Build a Photo Gallery using GridView.count.

              Each grid item should have:

              An image

              A title below or over it

              And when you tap the first image, show a SnackBar.
*/
