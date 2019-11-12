// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FTJokeUser _$FTJokeUserFromJson(Map<String, dynamic> json) {
  return FTJokeUser(
    json['id'] as String,
    json['username'] as String,
    json['sex'] as String,
    json['profile_image'] as String,
    json['weibo_uid'] as String,
    json['qq_uid'] as String,
    json['qzone_uid'] as String,
    json['is_vip'] as String,
    json['personal_page'] as String,
    json['total_cmt_like_count'] as String,
  );
}

Map<String, dynamic> _$FTJokeUserToJson(FTJokeUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'sex': instance.sex,
      'profile_image': instance.profile_image,
      'weibo_uid': instance.weibo_uid,
      'qq_uid': instance.qq_uid,
      'qzone_uid': instance.qzone_uid,
      'is_vip': instance.is_vip,
      'personal_page': instance.personal_page,
      'total_cmt_like_count': instance.total_cmt_like_count,
    };
