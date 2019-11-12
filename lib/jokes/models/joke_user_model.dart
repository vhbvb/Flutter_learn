import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

part 'joke_user_model.g.dart';
@JsonSerializable()
class FTJokeUser {

  FTJokeUser(this.id, this.username, this.sex, this.profile_image, this.weibo_uid, this.qq_uid, this.qzone_uid, this.is_vip, this.personal_page, this.total_cmt_like_count);

  final String id;
  final String username;
  final String sex;
  final String profile_image;
  final String weibo_uid;
  final String qq_uid;
  final String qzone_uid;
  final String is_vip;
  final String personal_page;
  final String total_cmt_like_count;

    factory FTJokeUser.fromJson(Map<String, dynamic> json) => _$FTJokeUserFromJson(json);
    Map<String, dynamic> toJson() => _$FTJokeUserToJson(this);
}