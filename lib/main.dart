import 'dart:convert';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapiapp/StringName.dart';
import 'package:http/http.dart' as http;

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


  @override
  Widget build(BuildContext context) {

   Future <StringName> fetchStringName() async {
     final response = await http.get('https://jsonplaceholder.typicode.com/users');
     

   }

    return Scaffold (
      appBar: AppBar(
        title: Text("Data from API with json"),
      ),
      body: ListView.builder(
          itemBuilder: (context,index) {
            return Card (
              child: Padding(
                padding: const EdgeInsets.only(top: 23.0, bottom: 23.0, left: 16.0, right: 16.0),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("name",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text("name",
                    style: (TextStyle(
                      color: Colors.grey.shade600,
                    )),
                    ),
                  ],
                ),

              ),
            );
          },
        itemCount: 10,
      ),
    );
  }
}
