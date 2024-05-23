import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'twitch_leaderboard.g.dart';

@JsonSerializable()
class TwitchLeaderboard extends Equatable {
    TwitchLeaderboard({
        required this.status,
        required this.data,
    });

    final String? status;
    static const String statusKey = "status";
    
    final List<Datum>? data;
    static const String dataKey = "data";
    

    TwitchLeaderboard copyWith({
        String? status,
        List<Datum>? data,
    }) {
        return TwitchLeaderboard(
            status: status ?? this.status,
            data: data ?? this.data,
        );
    }

    factory TwitchLeaderboard.fromJson(Map<String, dynamic> json) => _$TwitchLeaderboardFromJson(json);

    Map<String, dynamic> toJson() => _$TwitchLeaderboardToJson(this);

    @override
    String toString(){
        return "$status, $data, ";
    }

    @override
    List<Object?> get props => [
    status, data, ];
}

@JsonSerializable()
class Datum extends Equatable {
    Datum({
        required this.stream,
        required this.userId,
        required this.likeCount,
        required this.potAmount,
    });

    final Stream? stream;
    static const String streamKey = "stream";
    

    @JsonKey(name: 'user_id') 
    final String? userId;
    static const String userIdKey = "user_id";
    

    @JsonKey(name: 'like_count') 
    final int? likeCount;
    static const String likeCountKey = "like_count";
    

    @JsonKey(name: 'pot_amount') 
    final int? potAmount;
    static const String potAmountKey = "pot_amount";
    

    Datum copyWith({
        Stream? stream,
        String? userId,
        int? likeCount,
        int? potAmount,
    }) {
        return Datum(
            stream: stream ?? this.stream,
            userId: userId ?? this.userId,
            likeCount: likeCount ?? this.likeCount,
            potAmount: potAmount ?? this.potAmount,
        );
    }

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

    Map<String, dynamic> toJson() => _$DatumToJson(this);

    @override
    String toString(){
        return "$stream, $userId, $likeCount, $potAmount, ";
    }

    @override
    List<Object?> get props => [
    stream, userId, likeCount, potAmount, ];
}

@JsonSerializable()
class Stream extends Equatable {
    Stream({
        required this.id,
        required this.userId,
        required this.userLogin,
        required this.userName,
        required this.gameId,
        required this.gameName,
        required this.type,
        required this.title,
        required this.viewerCount,
        required this.startedAt,
        required this.language,
        required this.thumbnailUrl,
        required this.tagIds,
        required this.tags,
        required this.isMature,
    });

    final String? id;
    static const String idKey = "id";
    

    @JsonKey(name: 'user_id') 
    final String? userId;
    static const String userIdKey = "user_id";
    

    @JsonKey(name: 'user_login') 
    final String? userLogin;
    static const String userLoginKey = "user_login";
    

    @JsonKey(name: 'user_name') 
    final String? userName;
    static const String userNameKey = "user_name";
    

    @JsonKey(name: 'game_id') 
    final String? gameId;
    static const String gameIdKey = "game_id";
    

    @JsonKey(name: 'game_name') 
    final String? gameName;
    static const String gameNameKey = "game_name";
    
    final String? type;
    static const String typeKey = "type";
    
    final String? title;
    static const String titleKey = "title";
    

    @JsonKey(name: 'viewer_count') 
    final int? viewerCount;
    static const String viewerCountKey = "viewer_count";
    

    @JsonKey(name: 'started_at') 
    final DateTime? startedAt;
    static const String startedAtKey = "started_at";
    
    final String? language;
    static const String languageKey = "language";
    

    @JsonKey(name: 'thumbnail_url') 
    final String? thumbnailUrl;
    static const String thumbnailUrlKey = "thumbnail_url";
    

    @JsonKey(name: 'tag_ids') 
    final List<dynamic>? tagIds;
    static const String tagIdsKey = "tag_ids";
    
    final List<String>? tags;
    static const String tagsKey = "tags";
    

    @JsonKey(name: 'is_mature') 
    final bool? isMature;
    static const String isMatureKey = "is_mature";
    

    Stream copyWith({
        String? id,
        String? userId,
        String? userLogin,
        String? userName,
        String? gameId,
        String? gameName,
        String? type,
        String? title,
        int? viewerCount,
        DateTime? startedAt,
        String? language,
        String? thumbnailUrl,
        List<dynamic>? tagIds,
        List<String>? tags,
        bool? isMature,
    }) {
        return Stream(
            id: id ?? this.id,
            userId: userId ?? this.userId,
            userLogin: userLogin ?? this.userLogin,
            userName: userName ?? this.userName,
            gameId: gameId ?? this.gameId,
            gameName: gameName ?? this.gameName,
            type: type ?? this.type,
            title: title ?? this.title,
            viewerCount: viewerCount ?? this.viewerCount,
            startedAt: startedAt ?? this.startedAt,
            language: language ?? this.language,
            thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
            tagIds: tagIds ?? this.tagIds,
            tags: tags ?? this.tags,
            isMature: isMature ?? this.isMature,
        );
    }

    factory Stream.fromJson(Map<String, dynamic> json) => _$StreamFromJson(json);

    Map<String, dynamic> toJson() => _$StreamToJson(this);

    @override
    String toString(){
        return "$id, $userId, $userLogin, $userName, $gameId, $gameName, $type, $title, $viewerCount, $startedAt, $language, $thumbnailUrl, $tagIds, $tags, $isMature, ";
    }

    @override
    List<Object?> get props => [
    id, userId, userLogin, userName, gameId, gameName, type, title, viewerCount, startedAt, language, thumbnailUrl, tagIds, tags, isMature, ];
}
