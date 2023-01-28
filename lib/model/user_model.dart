import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? username;
  String? email;
  String? bio;
  String? image;
  String? cover;
  bool? isAdmin;
  bool? isVerified;
  String? password;
  bool? isFollower;
  bool? isFollowed;
  List<dynamic>? followers;
  List<dynamic>? following;
  String? token;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.bio,
    this.image,
    this.cover,
    this.isVerified,
    this.isAdmin,
    this.password,
    this.isFollowed,
    this.isFollower,
    this.followers,
    this.following,
    this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
