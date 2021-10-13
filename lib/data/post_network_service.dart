import 'dart:convert';

import 'package:http/http.dart' as http;

class PostNetworkService {
  final baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(Uri.parse(baseUrl + "/posts"));

    print(response.body);
    return jsonDecode(response.body) as List;
  }
}
