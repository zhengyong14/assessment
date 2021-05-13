import 'package:flutter/foundation.dart';

class Post {
  final int id;
  final int user_id;
  final String title;
  final String body;

  Post({
    @required this.id,
    @required this.user_id,
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
        user_id: json["user_id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": user_id,
        "title": title,
        "body": body,
      };
}
