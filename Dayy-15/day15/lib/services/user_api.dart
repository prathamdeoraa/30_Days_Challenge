import 'dart:convert';

import 'package:day15/model/main_user.dart';
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
    // final users = results.map((e) {
    // final name = UserName(
    //   title: e['name']['title'],
    //   first: e['name']['first'],
    //   last: e['name']['last'],
    // );
    // //picture
    // final picture = Picture(
    //   large: e['picture']['large'],
    //   medium: e['picture']['medium'],
    //   thumbnail: e['picture']['thumbnail'],
    // );
    // //[location]->[timezone]
    // final timezone = TimeZone(
    //   offset: e['location']['timezone']['offset'],
    //   description: e['location']['timezone']['description'],
    // );
    // //location
    // final location = Location(
    //   city: e['location']['city'],
    //   country: e['location']['country'],
    //   state: e['location']['state'],
    //   timezone: timezone,
    //   // postcode: e['location']['postcode'],
    // );
    // // final date = e['dob']['date'];
    // // final dob = UserDOB(age: e['dob']['age'], date: DateTime.parse(date));
    // // final timezone = Timezone(
    // //   offset: e['timezone']['offset'],
    // //   Description: e['timezone']['Description'],
    // // );
    // return User(
    //   email: e['email'],
    //   gender: e['gender'],
    //   phone: e['phone'],
    //   nat: e['nat'],
    //   cell: e['cell'],
    //   name: name,
    //   picture: picture,
    //   location: location,
    //   // dob: dob,
    //   // timezone: timezone,
    // );
    final users = results.map((e) {
      return User.fromMap(e);
    }).toList();

    print("fetch User ended");

    return users;
  }
}
