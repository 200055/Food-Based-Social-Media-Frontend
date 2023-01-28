import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? email;
  String? username;
  bool? isAdmin;
  bool? isVerified;
  List<dynamic?> followers;
  List<dynamic?> following;
  String? bio;
  String? image;
  bool? isGuest;
  bool? success;
  String? token;
  LoginResponse({
    this.id,
    this.name,
    this.email,
    this.username,
    this.isAdmin,
    this.isVerified,
    required this.followers,
    required this.following,
    this.bio,
    this.image,
    this.success,
    this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        username: json["username"],
        isAdmin: json["isAdmin"],
        isVerified: json["isVerified"],
        followers: json["followers"],
        following: json["following"],
        bio: json["bio"],
        image: json["image"],
        success: json["success"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "username": username,
        "isAdmin": isAdmin,
        "isVerified": isVerified,
        "followers": followers,
        "following": following,
        "bio": bio,
        "image": image,
        "success": success,
        "token": token,
      };
}
