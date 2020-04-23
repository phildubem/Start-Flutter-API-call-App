import 'dart:convert';
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapiapp/info.dart';
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

  final String url = "https://jsonplaceholder.typicode.com/users";
  List data;


  @override
  void initState(){
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {

    var response = await http.get(
      Uri.encodeFull(url),
    );

    print(response.body);

    setState(() {
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson;
    });

    return "Success";
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold (
      appBar: AppBar(
        title: Text("Data from API with json"),
      ),
      body: ListView.builder(
        itemBuilder: (context,index) {
          return Card (
            child: InkWell (
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Info(),
                    settings: RouteSettings(
                      arguments: data[index],
                    ),
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
                    color: Colors.blueAccent,
                  ),
                  Column (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(data[index]["name"],
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(data[index]["email"],
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  /*InkWell (
                    onTap: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Info(),
                      settings: RouteSettings(
                      arguments: data[index],
                          ),
                       ),
                      );
                    },
                  ),*/
                ],
              ),
            ),
           ),
          );
        },
        itemCount: data == null ? 0 : data.length,
      ),
    );
  }
}
