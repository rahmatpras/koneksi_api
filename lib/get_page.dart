import 'package:flutter/material.dart';
import 'package:koneksi_ke_api/post_result_model.dart';
import 'package:koneksi_ke_api/user_model.dart';

class GetPage extends StatefulWidget {
  @override
  _GetPageState createState() => _GetPageState();
}

class _GetPageState extends State<GetPage> {
  PostResult postResult = null;
  User user = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Single User API"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text((user != null) ? user.id + " | " + user.name : "Tidak ada data"),
          RaisedButton(
            onPressed: () {
              User.connectToAPI("3").then((value) {
                user = value;
                setState(() {});
              });
            },
            child: Text("GET"),
          )
        ],
      )),
    );
  }
}
