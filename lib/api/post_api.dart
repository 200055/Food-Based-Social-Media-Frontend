import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:posted_social_media/api/http_services.dart';
import 'package:posted_social_media/model/post_model.dart';
import 'package:posted_social_media/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostApi {
  // for viewing post
  Future<List<dynamic>> getPosts() async {
    Future.delayed(const Duration(seconds: 5), () {});
    List<dynamic> postResponse = [];

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");

      var dio = HttpServices().getDioInstance();

      Response response = await dio.get(
        getPostsUrl,
        // options: buildCacheOptions(const Duration(days: 7)),
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );

      // debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        for (var data in response.data!) {
          postResponse.add(data);
          List<dynamic> lstpost = postResponse;
          final List<String> strs = lstpost.map((e) => e.toString()).toList();
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setStringList('lstPot', strs);
          // debugPrint(postResponse.toString());
        }
      }
    } catch (e) {
      throw Exception(e);
    }
    return postResponse;
  }

  // add post
  Future<bool> createPost(PostModel post) async {
    bool isPost = false;
    Response response;
    var url = baseUrl + createPostUrl;
    var dio = HttpServices().getDioInstance();
    try {
      response = await dio.post(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
        data: post.toJson(),
      );
      if (response.statusCode == 201) {
        return isPost = true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isPost;
  }

  //like post
  Future<bool> likePost(String postId) async {
    bool isLiked = false;
    Response response;
    var url = baseUrl + getPostsUrl + postId + likePostsUrl;
    var dio = HttpServices().getDioInstance();
    try {
      response = await dio.get(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
        ),
      );
      if (response.statusCode == 201) {
        if (response.data == 'Liked the post') {
          return isLiked = true;
        } else {
          return isLiked = false;
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLiked;
  }
}
