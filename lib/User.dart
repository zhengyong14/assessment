import 'package:flutter/material.dart';
import 'User_service.dart';
import 'User_model.dart';
import 'User_detail.dart';
import 'User_add.dart';
import 'Userpage_service.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final HttpService httpService = HttpService();
  final PageService pageService = PageService();
  int page = 1;
  int pagenum;
  @override
  void initState() {
    pageService.getPage().then((value) {
      pagenum = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.skip_previous),
            onPressed: () {
              setState(() {
                page = 1;
              });
            },
          ),
          new IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              if (page == 1) {
                return null;
              }
              setState(() {
                page -= 1;
              });
            },
          ),
          new IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              if (page == pagenum) {
                return null;
              }
              setState(() {
                page += 1;
              });
            },
          ),
          new IconButton(
            icon: Icon(Icons.skip_next),
            onPressed: () async {
              setState(() {
                page = pagenum;
              });
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: httpService.getPosts(page),
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
