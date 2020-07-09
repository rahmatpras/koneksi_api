import 'package:flutter/material.dart';
import 'package:koneksi_ke_api/user_list_model.dart';

class GetListPage extends StatefulWidget {
  @override
  _GetListPageState createState() => _GetListPageState();
}

class _GetListPageState extends State<GetListPage> {
  String output = "no data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get List User API"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(output),
          RaisedButton(
            onPressed: () {
              UserList.getUsers("2").then((users) {
                output = "";
                for (int i = 0; i < users.length; i++)
                  output = output + "[ " + users[i].name + " ]";
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
