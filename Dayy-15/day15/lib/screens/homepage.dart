import 'package:flutter/material.dart';
import 'package:day15/model/user.dart';
import 'package:day15/services/user_api.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<User> user = [];

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUser();
    setState(() {
      user = response;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }

  void _refresh() {
    print("refresh called");
    setState(() {
      fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text(
          "DAY _15",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {
                _refresh();
              },
              icon: Icon(Icons.refresh, size: 40, color: Colors.black),
            ),
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: user.length,
        itemBuilder: (context, index) {
          final in_user = user[index];

          final email = in_user.email;

          final phone = in_user.phone;
          final String name = "${in_user.name.first} ${in_user.name.last}";
          final String fullname = in_user.fullname;
          // final email = in_user['email'];
          // final thumbnail = in_user['picture']['thumbnail'];
          // final phone = in_user['phone'];
          // final first = in_user.name.first;
          // final last = in_user.name.last;
          // final color = in_user.gender == 'male'
          //     ? Colors.blue
          //     : Colors.pink[200];

          return ListTile(
            leading: ClipRRect(
              child: Icon(Icons.local_grocery_store_outlined),
              borderRadius: BorderRadius.circular(40),
            ),

            title: Text(fullname),
            subtitle: Text(phone),
            // tileColor: color,
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => print("ListItem Selected"),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => {fetchUsers()},
        child: Icon(Icons.api),
      ),
    );
  }
}
