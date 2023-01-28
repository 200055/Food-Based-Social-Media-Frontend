// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      isAdmin: json['isAdmin'] as bool?,
      isVerified: json['isVerified'] as bool?,
      followers: json['followers'] as List<dynamic>,
      following: json['following'] as List<dynamic>,
      bio: json['bio'] as String?,
      image: json['image'] as String?,
      success: json['success'] as bool?,
      token: json['token'] as String?,
    )..isGuest = json['isGuest'] as bool?;

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'username': instance.username,
      'isAdmin': instance.isAdmin,
      'isVerified': instance.isVerified,
      'followers': instance.followers,
      'following': instance.following,
      'bio': instance.bio,
      'image': instance.image,
      'isGuest': instance.isGuest,
      'success': instance.success,
      'token': instance.token,
    };
