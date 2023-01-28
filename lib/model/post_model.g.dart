// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      id: json['_id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      postImage: json['images'] as List<dynamic>?,
      postText: json['tweetContent'] as String?,
      likes: json['likes'] as List<dynamic>?,
      comments: json['comments'] as List<dynamic>?,
      numLikes: json['numLikes'] as int?,
      numComments: json['numComments'] as int?,
      isLiked: json['isLiked'] as bool?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      '_id': instance.id,
      'user': instance.user,
      'tweetContent': instance.postText,
      'images': instance.postImage,
      'likes': instance.likes,
      'comments': instance.comments,
      'isLiked': instance.isLiked,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'numLikes': instance.numLikes,
      'numComments': instance.numComments,
    };
