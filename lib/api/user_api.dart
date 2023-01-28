import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:posted_social_media/api/http_services.dart';
import 'package:posted_social_media/model/user_model.dart';
import 'package:posted_social_media/response/login_response.dart';
import 'package:posted_social_media/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserApi {
  Future<bool> registerUser(User user) async {
    bool isSignup = false;
    Response response;
    var url = baseUrl + registerUrl;
    var dio = HttpServices().getDioInstance();
    try {
      response = await dio.post(
        url,
        data: user.toJson(),
      );
      if (response.statusCode == 201) {
        return isSignup = true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isSignup;
  }

  Future<bool> login(String email, String password) async {
    bool isLogin = false;
    try {
      var url = baseUrl + loginUrl;
      var dio = HttpServices().getDioInstance();

      var response = await dio.post(
        url,
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        token = loginResponse.token;
        userId = loginResponse.id;
        image = loginResponse.image;
        username = loginResponse.username;
        name = loginResponse.name;
        bio = loginResponse.bio;

        if (token == null) {
          isLogin = false;
        } else {
          if (token != null) {
            // debugPrint(token);
            // debugPrint(image);
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString("token", token!);
            prefs.setString("_id", userId!);
            prefs.setString("image", image!);
            prefs.setString("username", username!);
            prefs.setString("name", name!);
            prefs.setString("bio", bio!);
            isLogin = true;
          }
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }

  // view profile
  Future<List<dynamic>> getProfile() async {
    Future.delayed(const Duration(seconds: 5), () {});
    List<dynamic> profileResponse = [];

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      var dio = HttpServices().getDioInstance();
      Response response = await dio.get(
        getPostsUrl,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        for (var data in response.data!) {
          profileResponse.add(data);
        }
        // print(postResponse.length);
      }
    } catch (e) {
      throw Exception(e);
    }
    return profileResponse;
  }
}
