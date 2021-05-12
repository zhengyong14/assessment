import 'package:flutter/foundation.dart';

class Post {
  final int id;
  final int userId;
  final String title;
  final String body;

  Post({
    @required this.id,
    @required this.userId,
    @required this.title,
    @required this.body,
  });

  // factory Post.fromJson(Map<String, dynamic> json) {
  //   return Post(
  //     userId: json['userId'] as int,
  //     id: json['id'] as int,
  //     title: json['title'] as String,
  //     body: json['body'] as String,
  //   );
  // }

  factory Post.fromJson(Map<String, dynamic> json) => new Post(
        id: json["id"],
        userId: json["userId"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "title": title,
        "body": body,
      };
}
