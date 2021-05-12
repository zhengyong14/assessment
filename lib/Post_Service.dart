import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Post_Model.dart';

class HttpService {
  Future<List<Post>> getPosts() async {
    final url = "https://gorest.co.in/public-api/posts";
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
      Map<String, dynamic> body = jsonDecode(res.body);
      List<Post> posts = body['data']
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
