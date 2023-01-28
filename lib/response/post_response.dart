import 'package:json_annotation/json_annotation.dart';
import 'package:posted_social_media/model/post_model.dart';

part 'post_response.g.dart';

@JsonSerializable()
class PostResponse {
  List<PostModel>? data;

  PostResponse({this.data});

  factory PostResponse.fromJson(Map<String, dynamic> json) =>
      _$PostResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostResponseToJson(this);
}
