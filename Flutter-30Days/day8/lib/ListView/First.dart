import 'package:flutter/material.dart';

class ListViewNormal extends StatefulWidget {
  const ListViewNormal({super.key});

  @override
  State<ListViewNormal> createState() => _ListViewNormalState();
}

class _ListViewNormalState extends State<ListViewNormal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: Text("ListView Normal", style: TextStyle(fontWeight: FontWeight.bold)),
      ),

      // // ListView Simple Syntax ------------------------------->
      // body: ListView(
      //   children: [
      //     ListTile(
      //       leading: Icon(Icons.menu,),
      //       title: Text("First data"),

      //     ),
      //     Divider(color: Colors.red,),


      //   ],
      // ),



      // // ListView Builder Widget below commented program is of count no of list ------------------------------->
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, index) {
          return ListTile(
            leading: Icon(Icons.today),
            title: Text("Item ${index + 1}"),
            onTap: () => print("pressed ${index + 1} button"),
          );
        },
      ),


      // body: ListView.builder(
      //   itemCount: names.length,
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       leading: CircleAvatar(child: Text(names[index][0])),
      //       title: Text(names[index]),
      //       subtitle: Text("This is ${names[index]}"),
      //       trailing: Icon(Icons.arrow_forward_ios),
      //       onTap: () => print("Pressed ${names[index]}"),
      //     );
      //   },
      // ),

    );
  }
}