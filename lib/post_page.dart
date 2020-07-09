import 'package:flutter/material.dart';
import 'package:koneksi_ke_api/get_list_page.dart';
import 'package:koneksi_ke_api/get_page.dart';
import 'package:koneksi_ke_api/post_result_model.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  PostResult postResult = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Demo"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text((postResult != null)
              ? postResult.id +
                  " | " +
                  postResult.name +
                  " | " +
                  postResult.job +
                  " | " +
                  postResult.created
              : "Tidak ada data"),
          RaisedButton(
            onPressed: () {
              PostResult.connectToAPI("Tyo", "Programmer").then((value) {
                postResult = value;
                setState(() {});
              });
            },
            child: Text("POST"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GetPage();
              }));
            },
            child: Text("Go to Get Single User"),
          ),
          RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return GetListPage();
              }));
            },
            child: Text("Go to Get List User"),
          )
        ],
      )),
    );
  }
}
