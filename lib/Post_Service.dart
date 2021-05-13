import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'Post_Model.dart';

class HttpService {
  final url = "https://gorest.co.in/public-api/posts";

  Future<List<Post>> getPosts() async {
    final token =
        "958d8a9be060688d30bb7acce96ed76a796ba718edbf0969d15f75473c21407a";

    final res = await http.get(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });

    // final String postsURL = "https://jsonplaceholder.typicode.com/posts";
    // final res = await http.get(Uri.parse(postsURL));
    // print(res);

    if (res.statusCode == 200) {
      Map data = json.decode(res.body);
      final posts = (data['data'] as List).map((i) => new Post.fromJson(i));
      return posts.toList();
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<void> deletePosts(int id) async {
    final token =
        "958d8a9be060688d30bb7acce96ed76a796ba718edbf0969d15f75473c21407a";

    final res = await http.delete(Uri.parse("$url/$id"), headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (res.statusCode == 200) {
      print("DELETED");
    } else {
      throw "Unable to delete post.";
    }
  }
}
