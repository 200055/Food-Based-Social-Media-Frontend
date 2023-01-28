import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:posted_social_media/api/http_services.dart';
import 'package:posted_social_media/model/user_only_model.dart';
import 'package:posted_social_media/response/profile_response.dart';
import 'package:posted_social_media/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileApi {
  Future<ProfileResponse?> profileById(String username) async {
    String url = baseUrl + getProfileUrl;
    Dio dio = HttpServices().getDioInstance();
    ProfileResponse? profileResponse;
    // debugPrint("API USER" + username);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      Response response = await dio.get(
        (url + username),
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        profileResponse = ProfileResponse.fromJson(response.data);
      

      }
    } catch (e) {
      debugPrint("Error: ${e.toString()}");
    }
    return profileResponse;
  }

  Future<bool> editProfile(UserOnly user) async {
    bool isUpdated = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    String? username = prefs.getString("username");
    prefs.remove('username');
    String url = baseUrl + getProfileUrl;
    Dio dio = HttpServices().getDioInstance();
    debugPrint(user.toJson().toString());
    Response response = await dio.put(
      url,
      data: user.toJson(),
      options: Options(
        headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
      ),
    );

    if (response.statusCode == 200) {
      debugPrint(response.data.toString());
      token = response.data["token"].toString();

      username = response.data["username"].toString();
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("token", token);
      // prefs.setString("_id", userId!);
      // prefs.setString("image", image!);
      prefs.setString("username", username);
      // prefs.setString("name", name!);
      // prefs.setString("bio", bio!);
      return isUpdated = true;
    }
    return isUpdated;
  }
  
  Future<bool> followUnfollow(String id) async {
    bool isFollow = false;
    Response response;
    var url = baseUrl + followUnfollowUrl;
    var dio = HttpServices().getDioInstance();

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      response = await dio.get(
        (url + id),
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      if (response.statusCode == 200) {
        if (response.data == 'User unfollow') {
          return isFollow = false;
        } else {
          return isFollow = true;
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isFollow;
  }
  
}
