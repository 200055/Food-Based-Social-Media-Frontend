// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      bio: json['bio'] as String?,
      image: json['image'] as String?,
      cover: json['cover'] as String?,
      isVerified: json['isVerified'] as bool?,
      isAdmin: json['isAdmin'] as bool?,
      password: json['password'] as String?,
      isFollowed: json['isFollowed'] as bool?,
      isFollower: json['isFollower'] as bool?,
      followers: json['followers'] as List<dynamic>?,
      following: json['following'] as List<dynamic>?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'bio': instance.bio,
      'image': instance.image,
      'cover': instance.cover,
      'isAdmin': instance.isAdmin,
      'isVerified': instance.isVerified,
      'password': instance.password,
      'isFollower': instance.isFollower,
      'isFollowed': instance.isFollowed,
      'followers': instance.followers,
      'following': instance.following,
      'token': instance.token,
    };
