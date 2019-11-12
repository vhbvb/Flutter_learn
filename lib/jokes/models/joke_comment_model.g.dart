// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FTJokeComment _$FTJokeCommentFromJson(Map<String, dynamic> json) {
  return FTJokeComment(
    json['data_id'] as String,
    json['status'] as String,
    json['id'] as String,
    json['content'] as String,
    json['ctime'] as String,
    json['precid'] as String,
    json['preuid'] as String,
    json['like_count'] as String,
    json['voiceuri'] as String,
    json['voicetime'] as String,
    json['cmt_type'] as String,
  );
}

Map<String, dynamic> _$FTJokeCommentToJson(FTJokeComment instance) =>
    <String, dynamic>{
      'data_id': instance.data_id,
      'status': instance.status,
      'id': instance.id,
      'content': instance.content,
      'ctime': instance.ctime,
      'precid': instance.precid,
      'preuid': instance.preuid,
      'like_count': instance.like_count,
      'voiceuri': instance.voiceuri,
      'voicetime': instance.voicetime,
      'cmt_type': instance.cmt_type,
    };
