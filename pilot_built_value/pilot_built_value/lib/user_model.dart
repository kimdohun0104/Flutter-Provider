library user_model;

import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String login;
  final int id;
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;

  UserModel({this.login, this.id, this.avatarUrl});

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  static UserModel fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
