import 'package:flutter/material.dart';
import 'User_service.dart';
import 'User_model.dart';
import 'User_detail.dart';
import 'User_add.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
          if (snapshot.hasData) {
            List<User> posts = snapshot.data;
            return ListView(
              children: posts
                  .map(
                    (User user) => ListTile(
                      title: Text(user.name),
                      subtitle: Text(user.email),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UserDetails(users: user),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => UserAdd(),
          ),
        ),
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue[800],
      ),
    );
  }
}
