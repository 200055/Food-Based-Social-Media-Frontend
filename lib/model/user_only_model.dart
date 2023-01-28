import 'package:json_annotation/json_annotation.dart';
part 'user_only_model.g.dart';

@JsonSerializable()
class UserOnly {
  // @JsonKey(name: '_id')
  String? id;
  String? name;
  String? username;
  String? email;
  String? bio;

  UserOnly({
    this.id,
    this.name,
    this.username,
    this.email,
    this.bio,
  });

  factory UserOnly.fromJson(Map<String, dynamic> json) =>
      _$UserOnlyFromJson(json);

  Map<String, dynamic> toJson() => _$UserOnlyToJson(this);
}
