import 'dart:convert';
import 'package:http/http.dart' as http;
import 'User_model.dart';

class HttpService {
  final url = "https://gorest.co.in/public-api/users";
  final token =
      "958d8a9be060688d30bb7acce96ed76a796ba718edbf0969d15f75473c21407a";

  Future<List<User>> getPosts() async {
    //int number = 1;

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
      final users = (data['data'] as List).map((i) => new User.fromJson(i));
      return users.toList();
    } else {
      throw "Unable to retrieve users.";
    }
  }

  Future<void> deletePosts(int id) async {
    final res = await http.delete(Uri.parse("$url/$id"), headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (res.statusCode == 200) {
      return User.fromJson(jsonDecode(res.body));
    } else {
      throw "Unable to delete users.";
    }
  }

  Future<User> createPost(User users) async {
    Map data = {
      'name': users.name,
      'email': users.email,
      'gender': users.gender,
      'status': users.status
    };

    final res = await http.post(
      Uri.parse(url),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );
    if (res.statusCode == 200) {
      return User.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to post users.');
    }
  }

  Future<User> updatePost(int id, User users) async {
    Map data = {
      'name': users.name,
      'email': users.email,
      'gender': users.gender,
      'status': users.status
    };

    final res = await http.put(
      Uri.parse("$url/$id"),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(data),
    );
    if (res.statusCode == 200) {
      return User.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to update users.');
    }
  }
}
