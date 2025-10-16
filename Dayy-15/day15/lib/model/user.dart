import 'package:day15/model/username.dart';

class User {
  final String gender;
  final String phone;
  final String cell;
  final String email;
  final String nat;
  final UserName name;

  User({
    required this.gender,
    required this.phone,
    required this.cell,
    required this.email,
    required this.nat,
    required this.name,
  });

  String get fullname {
    return '${name.title} ${name.first} ${name.last}';
  }

  // factory User.void name(params) {

  // }
}

// class UserName {
//   final String title;
//   final String first;
//   final String last;

//   UserName({required this.title, required this.first, required this.last});
// }
