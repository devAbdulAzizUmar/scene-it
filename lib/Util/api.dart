import 'dart:convert';



import 'package:first_app/Models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class API {
  static const baseURL = "api.cappstech.com";

  //The following code executes upon clicking the login button
  static Future<http.Response> login(String username, String password) async {
    //The response is returned to the calling function.
    return await http.post(
      Uri.https(baseURL, "/auth/login"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        {
          "username": username,
          "password": password,
        },
      ),
    );
  }

  static Future<http.Response> getPosts() async {
    //This function is executed everytime a request for new posts is sent
    //and the result is then sent back to the UI for rendering
    final token = await FlutterSecureStorage().read(key: "token");
    CurrentUser.token = token;

    //The above lines need to be removed before shipping. Token has to be read from currentuser, not storage.
    return await http.post(
      Uri.https(baseURL, "/posts/getPosts"),
      body: jsonEncode({}),
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token",
      },
    );
  }

  static Future<http.Response> getMorePosts(String lastId) async {
    //get the next ten posts from the API for lazyloading

    final storage = FlutterSecureStorage();
    final token = await storage.read(key: "token");
    print("Fetching more...");

    return await http.post(
      Uri.https(baseURL, "/posts/getPosts"),
      body: jsonEncode({
        "lastPostId": lastId,
      }),
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token",
      },
    );
  }

  static Future<http.Response> getMoreUserPosts(
      String lastId, String username) async {
    //get the next ten posts from the API for lazyloading

    final storage = FlutterSecureStorage();
    final token = await storage.read(key: "token");
    print("Fetching more...");

    return await http.post(
      Uri.https(baseURL, "/posts/getPosts"),
      body: jsonEncode({
        "username": username,
        "lastPostId": lastId,
      }),
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token",
      },
    );
  }

  static Future<http.Response> getUserPosts({String username}) async {
    return await http.post(
      Uri.https(baseURL, "/posts/getPosts"),
      body: jsonEncode({
        "username": username,
      }),
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer ${CurrentUser.token}",
      },
    );
  }

  static Future<String> getSignedUrl() async {
    final responseSignedUrl = await http.get(
        Uri.https(
          baseURL,
          "/posts/getSignedUrl",
        ),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${CurrentUser.token}',
        });
    return responseSignedUrl.body;
  }

  static Future<http.Response> uploadImage({
    @required image,
    @required signedUrl,
  }) async {
    return await http.put(
      Uri.parse(signedUrl),
      body: image,
    );
  }

  static Future<http.Response> uploadPost({
    @required String title,
    @required String description,
    String location,
    List<String> imageUrls,
  }) async {
    final response = await http.post(
      Uri.http(baseURL, '/posts/addPost'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${CurrentUser.token}',
      },
      body: jsonEncode(
        {
          "userId": CurrentUser.id,
          "username": CurrentUser.userName,
          "title": title,
          "location": location,
          "body": description,
          "tags": ["vehicles", "bmw", "530D", "SE", "2014"],
          "isVehicle": false,
          "images": imageUrls,
          "vehicleInfo": {
            "transmissionType": "MANUAL",
            "ODO": 65000,
            "engineSize": 1560,
            "fuelType": "diesel",
            "power": 103.3,
            "bodyType": "hatchback",
            "modelYear": 2014
          }
        },
      ),
    );
    print(response.body);

    return response;
  }
}
