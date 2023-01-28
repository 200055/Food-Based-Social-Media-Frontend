import 'package:json_annotation/json_annotation.dart';
import 'package:posted_social_media/model/post_model.dart';
import 'package:posted_social_media/model/user_model.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  User? user;
  @JsonKey(name: 'tweets')
  List<PostModel>? posts;

  ProfileResponse({
    this.user,
    this.posts,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return _$ProfileResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileResponseToJson(this);
}
