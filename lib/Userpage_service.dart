import 'dart:convert';
import 'package:http/http.dart' as http;

class PageService {
  final url = "https://gorest.co.in/public-api/users";
  final token =
      "958d8a9be060688d30bb7acce96ed76a796ba718edbf0969d15f75473c21407a";

  Future<int> getPage() async {
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
      final meta = data['meta'] as Map<String, dynamic>;
      final pagination = meta['pagination'] as Map<String, dynamic>;
      final pages = pagination['pages'];
      return pages;
    } else {
      throw "Unable to retrieve users.";
    }
  }
}
