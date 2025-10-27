import 'dart:convert';

class Todovalue {
  String title;
  String description;
  bool isCompleted;

  Todovalue({
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  // Convert Todo → Map
  Map<String, dynamic> toMap() {
    return {
      "title": title,
      "description": description,
      "isCompleted": isCompleted,
    };
  }

  // Convert Map → Todo
  factory Todovalue.fromMap(Map<String, dynamic> map) {
    return Todovalue(
      title: map['title'] ?? "",
      description: map['description'] ?? "not empty",
      isCompleted: map['isCompleted'] ?? "",
    );
  }

  // Convert list of todos → JSON
  static String encode(List<Todovalue> todos) =>
      json.encode(todos.map((t) => t.toMap()).toList());

  // Convert JSON → list of todos
  static List<Todovalue> decode(String todoString) =>
      (json.decode(todoString) as List<dynamic>)
          .map<Todovalue>((item) => Todovalue.fromMap(item))
          .toList();
}
