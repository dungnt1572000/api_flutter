import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/catpage.dart';

const String breeds_url = 'https://catfact.ninja/breeds/';

class APIService {
  Future<CatPage> fetchCatPage(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // chuoi json tra ve
      print(response.body);
      return CatPage.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
