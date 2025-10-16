import 'dart:convert';

import 'package:day15/model/user.dart';
import 'package:day15/model/username.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<User>> fetchUser() async {
    print("fetch User called");
    const url = "https://randomuser.me/api/?results=100";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    final results = json['results'] as List<dynamic>; //when we make model

    //users is the things which gives us an output
    final users = results.map((e) {
      final name = UserName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last'],
      );
      return User(
        email: e['email'],
        gender: e['gender'],
        phone: e['phone'],
        nat: e['nat'],
        cell: e['cell'],
        name: name,
      );
    }).toList();

    print("fetch User ended");

    return users;
  }
}
