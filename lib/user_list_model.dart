import 'dart:convert';
import 'package:http/http.dart' as http;

class UserList {
  String id;
  String name;

  UserList({this.id, this.name});
 
  factory UserList.createUser(Map<String, dynamic> object) {
    return UserList(
        id: object['id'].toString(),
        name: object['first_name'] + " " + object['last_name']);
  }

  static Future<List<UserList>> getUsers(String page) async {
    String apiUrl = "https://reqres.in/api/users?page=" + page;

    //paggil api nya
    var apiResult = await http.get(apiUrl);
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listUser = (jsonObject as Map<String, dynamic>)['data'];

    List<UserList> users = [];
    for(int i = 0; i < listUser.length; i++)
      users.add(UserList.createUser(listUser[i]));

    return users;
  }

}
