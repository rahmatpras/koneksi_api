import 'dart:convert';

import 'package:http/http.dart' as http;

class PostResult {
  String id;
  String name;
  String job;
  String created;

  PostResult({this.id, this.name, this.job, this.created});
  
  //map<String, dynamic> karena key dari database berbentuk string, sedangkan valuenya tidak selalu berbentuk string
  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
      id: object['id'],
      name: object['name'],
      job: object['job'],
      created: object['createdAt']
    );
  }

  //method menghubungkan ke API nya
  static Future<PostResult> connectToAPI(String name, String job) async {
    String apiUrl = "https://reqres.in/api/users";

    var apiResult = await http.post(apiUrl, body: {
      "name": name,
      "job": job
    });

    var jsonObject = json.decode(apiResult.body);

    return PostResult.createPostResult(jsonObject);
  }
}
