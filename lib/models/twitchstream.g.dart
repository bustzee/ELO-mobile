// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'twitchstream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Twitchstream _$TwitchstreamFromJson(Map<String, dynamic> json) => Twitchstream(
      status: json['status'] as String?,
      twitchLivestreams: (json['twitchLivestreams'] as List<dynamic>?)
          ?.map((e) => TwitchLivestream.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TwitchstreamToJson(Twitchstream instance) =>
    <String, dynamic>{
      'status': instance.status,
      'twitchLivestreams': instance.twitchLivestreams,
    };

TwitchLivestream _$TwitchLivestreamFromJson(Map<String, dynamic> json) =>
    TwitchLivestream(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      userLogin: json['user_login'] as String?,
      userName: json['user_name'] as String?,
      gameId: json['game_id'] as String?,
      gameName: json['game_name'] as String?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      viewerCount: (json['viewer_count'] as num?)?.toInt(),
      startedAt: json['started_at'] == null
          ? null
          : DateTime.parse(json['started_at'] as String),
      language: json['language'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
      tagIds: json['tag_ids'] as List<dynamic>?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      isMature: json['is_mature'] as bool?,
    );

Map<String, dynamic> _$TwitchLivestreamToJson(TwitchLivestream instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'user_login': instance.userLogin,
      'user_name': instance.userName,
      'game_id': instance.gameId,
      'game_name': instance.gameName,
      'type': instance.type,
      'title': instance.title,
      'viewer_count': instance.viewerCount,
      'started_at': instance.startedAt?.toIso8601String(),
      'language': instance.language,
      'thumbnail_url': instance.thumbnailUrl,
      'tag_ids': instance.tagIds,
      'tags': instance.tags,
      'is_mature': instance.isMature,
    };
