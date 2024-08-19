import 'dart:convert';

import 'package:http/http.dart' as http;

class UserAll {
  String id;
  String name;
  UserAll({
    required this.id,
    required this.name,
  });
  factory UserAll.createUser(Map<String, dynamic> object) {
    return UserAll(
        id: object['id'].toString(),
        name: object['first_name'] + " " + object['last_name']);
  }

  static Future<List<UserAll>> getUsers(String page) async {
    String apiURL = "https://reqres.in/api/users?page=" + page;

    var apiResult = await http.get(Uri.parse(apiURL));
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listUser = (jsonObject as Map<String, dynamic>)['data'];

    List<UserAll> users = [];
    for (int i = 0; i < listUser.length; i++) {
      users.add(UserAll.createUser(listUser[i]));
    }
      
      return users;
  }
}
