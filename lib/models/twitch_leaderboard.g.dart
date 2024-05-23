// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'twitch_leaderboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TwitchLeaderboard _$TwitchLeaderboardFromJson(Map<String, dynamic> json) =>
    TwitchLeaderboard(
      status: json['status'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TwitchLeaderboardToJson(TwitchLeaderboard instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      stream: json['stream'] == null
          ? null
          : Stream.fromJson(json['stream'] as Map<String, dynamic>),
      userId: json['user_id'] as String?,
      likeCount: (json['like_count'] as num?)?.toInt(),
      potAmount: (json['pot_amount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'stream': instance.stream,
      'user_id': instance.userId,
      'like_count': instance.likeCount,
      'pot_amount': instance.potAmount,
    };

Stream _$StreamFromJson(Map<String, dynamic> json) => Stream(
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

Map<String, dynamic> _$StreamToJson(Stream instance) => <String, dynamic>{
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
