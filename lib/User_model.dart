import 'package:flutter/foundation.dart';

class User {
  final int id;
  final String name;
  final String email;
  final String gender;
  final String status;

  User({
    this.id,
    @required this.name,
    @required this.email,
    @required this.gender,
    @required this.status,
  });

  // factory Post.fromJson(Map<String, dynamic> json) {
  //   return Post(
  //     userId: json['userId'] as int,
  //     id: json['id'] as int,
  //     title: json['title'] as String,
  //     body: json['body'] as String,
  //   );
  // }

  factory User.fromJson(Map<String, dynamic> json) => new User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "gender": gender,
        "status": status,
      };
}
