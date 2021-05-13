import 'package:flutter/material.dart';
import 'Post_Model.dart';
import 'Post_Service.dart';

class PostDetails extends StatelessWidget {
  final HttpService httpService = HttpService();
  final Post post;
  PostDetails({@required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              await httpService.deletePosts(post.id);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: Text("Title"),
              subtitle: Text(post.title),
            ),
            ListTile(
              title: Text("Content"),
              subtitle: Text(post.body),
            ),
            ListTile(
              title: Text("User ID"),
              subtitle: Text("${post.user_id}"),
            ),
          ],
        ),
      ),
    );
  }
}
