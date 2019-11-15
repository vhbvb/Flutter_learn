
import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

part 'joke_model.g.dart';
@JsonSerializable()
class FTJokeModel {
  FTJokeModel(this.id, this.type, this.text, this.user_id, this.name, this.profile_image, this.created_at, this.create_time, this.passtime, this.love, this.hate, this.comment, this.repost, this.bookmark, this.bimageuri, this.voiceuri, this.voicetime, this.voicelength, this.status, this.theme_id, this.theme_name, this.theme_type, this.videouri, this.videotime, this.original_pid, this.cache_version, this.cai, this.top_cmt, this.weixin_url, this.image0, this.image2, this.image1, this.cdn_img, this.is_gif, this.width, this.height, this.tag, this.t, this.ding, this.favourite, this.playcount);

  final String id;
  final String type;
  final String text;
  final String user_id;
  final String name;
  final String profile_image;
  final String created_at;
  final String create_time;
  final String passtime;
  final String love;
  final String hate;
  final String comment;
  final String repost;
  final String bookmark;
  final String bimageuri;
  final String voiceuri;
  final String voicetime;
  final String voicelength;
  final String status;
  final String theme_id;
  final String theme_name;
  final String theme_type;
  final String videouri;
  final String videotime;
  final String original_pid;
  final String playcount;
  final int cache_version;
  final String cai;
  final List top_cmt;
  final String weixin_url;
  final String image0;
  final String image2;
  final String image1;
  final String cdn_img;
  final String is_gif;
  final String width;
  final String height;
  final String tag;
  final int t;
  final String ding;
  final String favourite;

  factory FTJokeModel.fromJson(Map<String, dynamic> json) => _$FTJokeModelFromJson(json);
  Map<String, dynamic> toJson() => _$FTJokeModelToJson(this);
}




