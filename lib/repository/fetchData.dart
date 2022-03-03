import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:retrofit/http.dart';

import 'package:bloc_training/model/page2/user_create.dart';
import 'package:bloc_training/model/page2/user_respone.dart';

import '../model/catpage.dart';

part 'fetchData.g.dart';

const String breeds_url = 'https://catfact.ninja/breeds/';
const String authen =
    'Bearer 37e4a8f0b1253156b05ce5cd9490f70eb0d0f2e9eb388a2a74041078947bf8c6';

@RestApi(baseUrl: 'https://catfact.ninja/')
abstract class ApiClient {
  factory ApiClient(Dio dio) {
    dio.options = BaseOptions(
        connectTimeout: 30000,
        receiveTimeout: 30000,
        contentType: 'application/json');
    return _ApiClient(dio);
  }
  @GET('breeds/')
  Future<CatPage> getCatPage(@Query('page') int page);
}

@RestApi(baseUrl: 'https://gorest.co.in')
abstract class ApiUser {
  factory ApiUser(Dio dio) {
    return _ApiUser(dio);
  }

  @GET('/public/v2/users/{id}')
  Future<UserRespone> getInForUser(@Header('Authorization') String author,@Path('id') int id);

  @POST('/public/v2/users/')
  Future<UserRespone> posttoSV(
      @Header('Authorization') String author, @Body() Map<String,dynamic> body);
}

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
