import 'package:flutter/material.dart';
import 'package:flutter_app/User.dart';
import 'package:flutter_app/User_edit.dart';
import 'User_model.dart';
import 'User_edit.dart';
import 'User_service.dart';

class UserDetails extends StatelessWidget {
  final HttpService httpService = HttpService();
  final User users;
  UserDetails({@required this.users});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Detail"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () async {
              await httpService.deletePosts(users.id);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => UserPage()),
                (Route<dynamic> route) => false,
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: Text("User Name"),
              subtitle: Text(users.name),
            ),
            ListTile(
              title: Text("User Email"),
              subtitle: Text(users.email),
            ),
            ListTile(
              title: Text("User Gender"),
              subtitle: Text(users.gender),
            ),
            ListTile(
              title: Text("User Status"),
              subtitle: Text(users.status),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => UserEdit(users: users),
                        ),
                      );
                    },
                    child: Text('Click to edit',
                        style: TextStyle(color: Colors.white)),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
