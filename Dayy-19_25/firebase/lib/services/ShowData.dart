import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Uihelper/UiHelper.dart';
import 'package:flutter/material.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('show data'),
        backgroundColor: Colors.amber,
      ),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
        builder: (context, snapshots) {

          if (snapshots.connectionState == ConnectionState.active) {
            if (snapshots.hasData) {
              return ListView.builder(
                itemCount: snapshots.data!.docs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(child: Text("${index + 1}")),
                    title: Text('${snapshots.data!.docs[index]['title']}'),
                    subtitle: Text('${snapshots.data!.docs[index]['desc']}'),
                  );
                },
              );
            } else if (snapshots.hasError) {
              // UiHelper.AlerBox(context, snapshots.hasError.toString());
              return Center(child: Text('${snapshots.hasError.toString()}'));
            }
          } else {
            return Center(child: CircularProgressIndicator());
          }
          return Center();
        },
      ),
    );
  }
}
