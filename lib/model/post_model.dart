import 'package:json_annotation/json_annotation.dart';
import 'package:posted_social_media/model/user_model.dart';
part 'post_model.g.dart';

@JsonSerializable()
class PostModel {
  @JsonKey(name: '_id')
  String? id;
  User? user;
  @JsonKey(name: 'tweetContent')
  String? postText;
  @JsonKey(name: 'images')
  List<dynamic>? postImage;
  List<dynamic>? likes;
  List<dynamic>? comments;
  bool? isLiked;
  String? createdAt;
  String? updatedAt;
  int? numLikes;
  int? numComments;

  PostModel({
    this.id,
    this.user,
    this.postImage,
    this.postText,
    this.likes,
    this.comments,
    this.numLikes,
    this.numComments,
    this.isLiked,
    this.createdAt,
    this.updatedAt,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return _$PostModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
