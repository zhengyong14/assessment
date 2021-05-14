import 'package:flutter/material.dart';
import 'User_model.dart';
import 'User_service.dart';
import 'User.dart';

enum Gender { Male, Female }
enum Status { Active, Inactive }

class UserEdit extends StatefulWidget {
  final User users;
  UserEdit({Key key, @required this.users}) : super(key: key);
  _UserEditPageState createState() => _UserEditPageState(users);
}

class _UserEditPageState extends State<UserEdit> {
  int id;
  final User users;
  _UserEditPageState(this.users);
  final HttpService httpService = HttpService();
  final _addFormKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  String gender = 'Male';
  Gender _gender = Gender.Male;
  final _emailController = TextEditingController();
  String status = 'Active';
  Status _status = Status.Active;

  void initState() {
    id = users.id;
    _nameController.text = users.name;
    _emailController.text = users.email;
    status = users.status;
    if (users.status == 'Active') {
      _status = Status.Active;
    } else {
      _status = Status.Inactive;
    }
    gender = users.gender;
    if (users.gender == 'Male') {
      _gender = Gender.Male;
    } else {
      _gender = Gender.Female;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Post'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.all(20.0),
            child: Card(
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: 440,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Full Name'),
                              TextFormField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                  hintText: 'Full Name',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter full name';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Email'),
                              TextFormField(
                                controller: _emailController,
                                decoration: const InputDecoration(
                                  hintText: 'Email',
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value.isEmpty ||
                                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(value)) {
                                    return 'Please enter email';
                                  }
                                  return null;
                                },
                                onChanged: (value) {},
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Gender'),
                              ListTile(
                                title: const Text('Male'),
                                leading: Radio(
                                  value: Gender.Male,
                                  groupValue: _gender,
                                  onChanged: (Gender value) {
                                    setState(() {
                                      _gender = value;
                                      gender = 'Male';
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Female'),
                                leading: Radio(
                                  value: Gender.Female,
                                  groupValue: _gender,
                                  onChanged: (Gender value) {
                                    setState(() {
                                      _gender = value;
                                      gender = 'Female';
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Text('Status'),
                              ListTile(
                                title: const Text('Active'),
                                leading: Radio(
                                  value: Status.Active,
                                  groupValue: _status,
                                  onChanged: (Status value) {
                                    setState(() {
                                      _status = value;
                                      status = 'Active';
                                    });
                                  },
                                ),
                              ),
                              ListTile(
                                title: const Text('Inactive'),
                                leading: Radio(
                                  value: Status.Inactive,
                                  groupValue: _status,
                                  onChanged: (Status value) {
                                    setState(() {
                                      _status = value;
                                      status = 'Inactive';
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: () {
                                  if (_addFormKey.currentState.validate()) {
                                    _addFormKey.currentState.save();
                                    httpService.updatePost(
                                        id,
                                        User(
                                            name: _nameController.text,
                                            email: _emailController.text,
                                            gender: gender,
                                            status: status));

                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UserPage()),
                                      (Route<dynamic> route) => false,
                                    );
                                  }
                                },
                                child: Text('Edit',
                                    style: TextStyle(color: Colors.white)),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue)),
                              )
                            ],
                          ),
                        ),
                      ],
                    ))),
          ),
        ),
      ),
    );
  }
}
