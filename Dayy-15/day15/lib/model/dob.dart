class UserDOB {
  final DateTime date;
  final int age;

  UserDOB({required this.date, required this.age});

  factory UserDOB.fromMap(Map<String, dynamic>? json) {
    if (json == null) {
      return UserDOB(date: DateTime.now(), age: 0);
    }

    return UserDOB(
      date: DateTime.tryParse(json['date'] ?? '') ?? DateTime.now(),
      age: json['age'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'date': date.toIso8601String(), 'age': age};
  }
}
