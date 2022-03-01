import 'dart:convert';
import 'dart:io';

import 'package:bloc_training/model/page2/user_create.dart';
import 'package:bloc_training/model/page2/user_respone.dart';
import 'package:http/http.dart' as http;

import '../model/catpage.dart';

const String breeds_url = 'https://catfact.ninja/breeds/';
const String authen =
    'Bearer 37e4a8f0b1253156b05ce5cd9490f70eb0d0f2e9eb388a2a74041078947bf8c6';

class APIService {
  Future<CatPage> fetchCatPage(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // chuoi json tra ve
      print(response.body);
      return CatPage.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load CatPage');
    }
  }

  Future<UserRespone> fetchUser(String id) async {
    final respone = await http
        .get(Uri.parse('https://gorest.co.in/public/v2/users/$id'), headers: {
      HttpHeaders.authorizationHeader: authen,
    });

    if (respone.statusCode == 200) {
      print(respone.body);
      return UserRespone.fromJson(jsonDecode(respone.body));
    } else {
      throw Exception('Failed to load User');
    }
  }

  Future<UserRespone> createUser(UserCreate userCreate) async {
    print(userCreate.toString());
    final respone = await http.post(
      Uri.parse('https://gorest.co.in/public/v2/users/'),
      headers: {
        HttpHeaders.authorizationHeader: authen,
      },
      body: userCreate.toJson(),
    );

    if (respone.statusCode == 201) {
      print(respone.body);
      return UserRespone.fromJson(jsonDecode(respone.body));
    } else {
      print('Day la status ' + respone.statusCode.toString());
      print(respone.body);
      print(respone.contentLength);
      throw Exception('can not post ');
    }
  }
}
