// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Users'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   Future<List<User>> _getUsers() async {
//     var data = await http.get('https://gorest.co.in/public-api/users');

//     var jsonData = json.decode(data.body);

//     List<User> users = [];

//     for (var u in jsonData) {
//       User user = User(u["index"], u["name"], u["email"], u["gender"]);

//       users.add(user);
//     }
//     print(users.length);

//     return users;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Container(
//           child: FutureBuilder(
//               future: _getUsers(),
//               builder: (BuildContext context, AsyncSnapshot snapshot) {
//                 if (snapshot.data == null) {
//                   return Container(child: Center(child: Text("Loading...")));
//                 } else {
//                   return ListView.builder(
//                       itemCount: snapshot.data.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return ListTile(
//                           title: Text(snapshot.data[index].name),
//                         );
//                       });
//                 }
//               })),
//     );
//   }
// }

// class User {
//   final int index;
//   final String name;
//   final String email;
//   final String gender;

//   User(this.index, this.name, this.email, this.gender);
// }
