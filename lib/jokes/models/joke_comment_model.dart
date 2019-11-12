import 'dart:core';
import 'package:json_annotation/json_annotation.dart';

part 'joke_comment_model.g.dart';
@JsonSerializable()
class FTJokeComment {

  FTJokeComment(this.data_id, this.status, this.id, this.content, this.ctime, this.precid, this.preuid, this.like_count, this.voiceuri, this.voicetime, this.cmt_type);

  final String data_id;
  final String status;
  final String id;
  final String content;
  final String ctime;
  final String precid;
  final String preuid;
  final String like_count;
  final String voiceuri;
  final String voicetime;
  final String cmt_type;

    factory FTJokeComment.fromJson(Map<String, dynamic> json) => _$FTJokeCommentFromJson(json);
    Map<String, dynamic> toJson() => _$FTJokeCommentToJson(this);
}