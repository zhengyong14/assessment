import 'dart:convert';
import 'package:http/http.dart' as http;
import 'User_model.dart';

class HttpService {
  final url = "https://gorest.co.in/public-api/users";
  final token =
      "958d8a9be060688d30bb7acce96ed76a796ba718edbf0969d15f75473c21407a";
  Map<String, String> get requestHeaders => {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      };

  Future<List<User>> getPosts(int page) async {
    //int number = 1;

    final res =
        await http.get(Uri.parse('$url?page=$page'), headers: requestHeaders);

    if (res.statusCode == 200) {
      // Map data = json.decode(res.body);
      // final users = (data['data'] as List).map((i) => new User.fromJson(i));
      // return users.toList();
      Map data = json.decode(res.body);
      List<User> users =
          (data['data'] as List).map((i) => new User.fromJson(i)).toList();
      return users;
    } else {
      throw "Unable to retrieve users.";
    }
  }

  Future<void> deletePosts(int id) async {
    final res =
        await http.delete(Uri.parse("$url/$id"), headers: requestHeaders);

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
      headers: requestHeaders,
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
      headers: requestHeaders,
      body: jsonEncode(data),
    );
    if (res.statusCode == 200) {
      return User.fromJson(json.decode(res.body));
    } else {
      throw Exception('Failed to update users.');
    }
  }
}
