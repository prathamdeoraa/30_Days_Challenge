import 'package:day15/model/dob.dart';
import 'package:day15/model/picture.dart';

import 'package:day15/model/user_location.dart';
import 'package:day15/model/username.dart';

class User {
  final String gender;
  final String phone;
  final String cell;
  final String email;
  final String nat;
  final UserName name;
  final UserDOB dob;
  final Location location;
  final Picture picture;

  User({
    required this.gender,
    required this.phone,
    required this.cell,
    required this.email,
    required this.nat,
    required this.name,
    required this.location,
    required this.picture,
    required this.dob,
  });

  String get fullname {
    return '${name.title} ${name.first} ${name.last}';
  }

  factory User.fromMap(Map<String, dynamic> e) {
    final name = UserName(
      title: e['name']['title'],
      first: e['name']['first'],
      last: e['name']['last'],
    );
    //picture
    final picture = Picture.fromMap(e['picture']);
    //location
    final location = Location.fromMap(e['location']);

    // dob
    final dob = UserDOB.fromMap(e["dob"]);

    return User(
      email: e['email'],
      gender: e['gender'],
      phone: e['phone'],
      nat: e['nat'],
      cell: e['cell'],
      name: name,
      picture: picture,
      location: location,
      dob: dob,
    );
  }
}

// class UserName {
//   final String title;
//   final String first;
//   final String last;

//   UserName({required this.title, required this.first, required this.last});
// }
