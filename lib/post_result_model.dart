import 'dart:convert';
import 'package:http/http.dart' as http;

class PostResult {
  String id;
  String name;
  String job;
  String created;

  PostResult({
    required this.id,
    required this.name,
    required this.job,
    required this.created,
  });

  factory PostResult.createPostResult(Map<String, dynamic> object) {
    return PostResult(
      id: object['id'],
      name: object['name'],
      job: object['job'],
      created: object['createdAt'], // Gunakan 'createdAt' sesuai dengan API response
    );
  }

  static Future<PostResult> connectToAPI(String name, String job) async {
    String apiURL = "https://reqres.in/api/users";

    var apiResult = await http.post(Uri.parse(apiURL), body: {
      "name": name,
      "job": job,
    });

    var jsonObject = json.decode(apiResult.body);

    return PostResult.createPostResult(jsonObject);
  }
}
