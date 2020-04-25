import 'package:flutter/material.dart';
import 'package:flutterapiapp/main.dart';



class Info extends StatelessWidget {
  final Model data;

  Info(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Data for User ' + data.id.toString()),
      ),
       body: Padding (
         padding: const EdgeInsets.only(top: 45.0, bottom: 45.0, right: 10.0, left: 10.0),
        child: Card(
          color: Colors.lightBlue,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon (Icons.person_pin,
                size: 90.0,
                  color: Colors.black,
                ),
                Text(data.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                Text (data.username,
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontSize: 30,
                ),
                ),
                Text (data.email,
                  style: TextStyle(
                    color: Colors.grey.shade800,
                    fontSize: 25,
                  ),
                ),
                Text (data.phone,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}