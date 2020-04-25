import 'dart:convert';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapiapp/info.dart';
import 'package:http/http.dart' as http;


class Model {
  String name;
  String email;
  String username;
  String phone;
  int id;


  Model(this.name, this.email, this.username, this.phone, this.id);


  Model.json(Map<String, dynamic> json) {
    name= json['name'];
    email = json['email'];
    username = json['username'];
    phone = json['phone'];
    id =json['id'];
  }
}
void main() => runApp(new MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "Data from API with json",
  home: new HomePage(),
));


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage>  {
  Future<List<Model>> fetchInfo() async {
    var apiUrl = 'https://jsonplaceholder.typicode.com/users';
    var result = await http.get(apiUrl);

    var users = List<Model>();

    if (result.statusCode == 200) {
      var usersJson = json.decode(result.body);
      for (var user in usersJson) {
        users.add(Model.json(user));
      }
    }
    return users;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBar(
          title: Text("Data from API with json"),
        ),
        body: FutureBuilder<List<dynamic>>(
            future: fetchInfo(),
            builder: (BuildContext context, AsyncSnapshot phil) {
              return ListView.builder(
                itemBuilder: (context,index) {
                  return Card (
                    child: InkWell (
                      onTap: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Info(phil.data[index])
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 23.0, bottom: 23.0, left: 16.0, right: 16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.person,
                              size: 50.0,
                              color: Colors.blue,
                            ),
                            Column (
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(phil.data[index].name,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(phil.data[index].email,
                                  style: TextStyle(
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: phil.data == null ? 0 : phil.data.length,
              );
            }));
  }
}