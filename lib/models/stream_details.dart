import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stream_details.g.dart';

@JsonSerializable()
class StreamDetails extends Equatable {
    StreamDetails({
        required this.status,
        required this.data,
    });

    final String? status;
    static const String statusKey = "status";
    
    final Data? data;
    static const String dataKey = "data";
    

    StreamDetails copyWith({
        String? status,
        Data? data,
    }) {
        return StreamDetails(
            status: status ?? this.status,
            data: data ?? this.data,
        );
    }

    factory StreamDetails.fromJson(Map<String, dynamic> json) => _$StreamDetailsFromJson(json);

    Map<String, dynamic> toJson() => _$StreamDetailsToJson(this);

    @override
    String toString(){
        return "$status, $data, ";
    }

    @override
    List<Object?> get props => [
    status, data, ];
}

@JsonSerializable()
class Data extends Equatable {
    Data({
        required this.livestream,
        required this.potAmount,
        required this.setting,
        required this.gameName,
        required this.playerStats,
        required this.activeBets,
        required this.bettingMasters,
        required this.conversion,
        required this.countLabel,
        required this.chkLabel,
        required this.labelName,
        required this.countBet,
        required this.email,
        required this.userRoomNames,
        required this.currentRoomNames,
        required this.rmName,
        required this.isUserBetted,
        required this.likeCount,
        required this.dislikeCount,
    });

    final Livestream? livestream;
    static const String livestreamKey = "livestream";
    

    @JsonKey(name: 'pot_amount') 
    final int? potAmount;
    static const String potAmountKey = "pot_amount";
    
    final Setting? setting;
    static const String settingKey = "setting";
    

    @JsonKey(name: 'game_name') 
    final String? gameName;
    static const String gameNameKey = "game_name";
    

    @JsonKey(name: 'player_stats') 
    final dynamic playerStats;
    static const String playerStatsKey = "player_stats";
    

    @JsonKey(name: 'active_bets') 
    final List<ActiveBet>? activeBets;
    static const String activeBetsKey = "active_bets";
    

    @JsonKey(name: 'betting_masters') 
    final List<Master>? bettingMasters;
    static const String bettingMastersKey = "betting_masters";
    
    final Conversion? conversion;
    static const String conversionKey = "conversion";
    

    @JsonKey(name: 'count_label') 
    final int? countLabel;
    static const String countLabelKey = "count_label";
    

    @JsonKey(name: 'chk_label') 
    final List<ChkLabel>? chkLabel;
    static const String chkLabelKey = "chk_label";
    

    @JsonKey(name: 'label_name') 
    final dynamic labelName;
    static const String labelNameKey = "label_name";
    

    @JsonKey(name: 'count_bet') 
    final int? countBet;
    static const String countBetKey = "count_bet";
    
    final String? email;
    static const String emailKey = "email";
    

    @JsonKey(name: 'user_room_names') 
    final String? userRoomNames;
    static const String userRoomNamesKey = "user_room_names";
    

    @JsonKey(name: 'current_room_names') 
    final String? currentRoomNames;
    static const String currentRoomNamesKey = "current_room_names";
    

    @JsonKey(name: 'rm_name') 
    final String? rmName;
    static const String rmNameKey = "rm_name";
    

    @JsonKey(name: 'is_user_betted') 
    final bool? isUserBetted;
    static const String isUserBettedKey = "is_user_betted";
    

    @JsonKey(name: 'like_count') 
    final int? likeCount;
    static const String likeCountKey = "like_count";
    

    @JsonKey(name: 'dislike_count') 
    final int? dislikeCount;
    static const String dislikeCountKey = "dislike_count";
    

    Data copyWith({
        Livestream? livestream,
        int? potAmount,
        Setting? setting,
        String? gameName,
        dynamic playerStats,
        List<ActiveBet>? activeBets,
        List<Master>? bettingMasters,
        Conversion? conversion,
        int? countLabel,
        List<ChkLabel>? chkLabel,
        dynamic labelName,
        int? countBet,
        String? email,
        String? userRoomNames,
        String? currentRoomNames,
        String? rmName,
        bool? isUserBetted,
        int? likeCount,
        int? dislikeCount,
    }) {
        return Data(
            livestream: livestream ?? this.livestream,
            potAmount: potAmount ?? this.potAmount,
            setting: setting ?? this.setting,
            gameName: gameName ?? this.gameName,
            playerStats: playerStats ?? this.playerStats,
            activeBets: activeBets ?? this.activeBets,
            bettingMasters: bettingMasters ?? this.bettingMasters,
            conversion: conversion ?? this.conversion,
            countLabel: countLabel ?? this.countLabel,
            chkLabel: chkLabel ?? this.chkLabel,
            labelName: labelName ?? this.labelName,
            countBet: countBet ?? this.countBet,
            email: email ?? this.email,
            userRoomNames: userRoomNames ?? this.userRoomNames,
            currentRoomNames: currentRoomNames ?? this.currentRoomNames,
            rmName: rmName ?? this.rmName,
            isUserBetted: isUserBetted ?? this.isUserBetted,
            likeCount: likeCount ?? this.likeCount,
            dislikeCount: dislikeCount ?? this.dislikeCount,
        );
    }

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);

    @override
    String toString(){
        return "$livestream, $potAmount, $setting, $gameName, $playerStats, $activeBets, $bettingMasters, $conversion, $countLabel, $chkLabel, $labelName, $countBet, $email, $userRoomNames, $currentRoomNames, $rmName, $isUserBetted, $likeCount, $dislikeCount, ";
    }

    @override
    List<Object?> get props => [
    livestream, potAmount, setting, gameName, playerStats, activeBets, bettingMasters, conversion, countLabel, chkLabel, labelName, countBet, email, userRoomNames, currentRoomNames, rmName, isUserBetted, likeCount, dislikeCount, ];
}

@JsonSerializable()
class ActiveBet extends Equatable {
    ActiveBet({
        required this.id,
        required this.bettingAmount,
        required this.forText,
        required this.againstText,
        required this.description,
        required this.masterBettingId,
        required this.userId,
        required this.livestreamId,
        required this.createdAt,
        required this.updatedAt,
        required this.wonSide,
        required this.declarationDate,
        required this.declarationBy,
        required this.isDeclaredResult,
        required this.streamerFee,
        required this.total,
        required this.isAddBet,
        required this.isClaimBet,
        required this.master,
        required this.user,
        required this.bets,
    });

    final int? id;
    static const String idKey = "id";
    

    @JsonKey(name: 'betting_amount') 
    final String? bettingAmount;
    static const String bettingAmountKey = "betting_amount";
    

    @JsonKey(name: 'for_text') 
    final String? forText;
    static const String forTextKey = "for_text";
    

    @JsonKey(name: 'against_text') 
    final String? againstText;
    static const String againstTextKey = "against_text";
    
    final String? description;
    static const String descriptionKey = "description";
    

    @JsonKey(name: 'master_betting_id') 
    final int? masterBettingId;
    static const String masterBettingIdKey = "master_betting_id";
    

    @JsonKey(name: 'user_id') 
    final int? userId;
    static const String userIdKey = "user_id";
    

    @JsonKey(name: 'livestream_id') 
    final int? livestreamId;
    static const String livestreamIdKey = "livestream_id";
    

    @JsonKey(name: 'created_at') 
    final DateTime? createdAt;
    static const String createdAtKey = "created_at";
    

    @JsonKey(name: 'updated_at') 
    final DateTime? updatedAt;
    static const String updatedAtKey = "updated_at";
    

    @JsonKey(name: 'won_side') 
    final String? wonSide;
    static const String wonSideKey = "won_side";
    

    @JsonKey(name: 'declaration_date') 
    final dynamic declarationDate;
    static const String declarationDateKey = "declaration_date";
    

    @JsonKey(name: 'declaration_by') 
    final dynamic declarationBy;
    static const String declarationByKey = "declaration_by";
    

    @JsonKey(name: 'is_declared_result') 
    final int? isDeclaredResult;
    static const String isDeclaredResultKey = "is_declared_result";
    

    @JsonKey(name: 'streamer_fee') 
    final dynamic streamerFee;
    static const String streamerFeeKey = "streamer_fee";
    
    final int? total;
    static const String totalKey = "total";
    

    @JsonKey(name: 'is_add_bet') 
    final int? isAddBet;
    static const String isAddBetKey = "is_add_bet";
    

    @JsonKey(name: 'is_claim_bet') 
    final int? isClaimBet;
    static const String isClaimBetKey = "is_claim_bet";
    
    final Master? master;
    static const String masterKey = "master";
    
    final User? user;
    static const String userKey = "user";
    
    final List<Bet>? bets;
    static const String betsKey = "bets";
    

    ActiveBet copyWith({
        int? id,
        String? bettingAmount,
        String? forText,
        String? againstText,
        String? description,
        int? masterBettingId,
        int? userId,
        int? livestreamId,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? wonSide,
        dynamic declarationDate,
        dynamic declarationBy,
        int? isDeclaredResult,
        dynamic streamerFee,
        int? total,
        int? isAddBet,
        int? isClaimBet,
        Master? master,
        User? user,
        List<Bet>? bets,
    }) {
        return ActiveBet(
            id: id ?? this.id,
            bettingAmount: bettingAmount ?? this.bettingAmount,
            forText: forText ?? this.forText,
            againstText: againstText ?? this.againstText,
            description: description ?? this.description,
            masterBettingId: masterBettingId ?? this.masterBettingId,
            userId: userId ?? this.userId,
            livestreamId: livestreamId ?? this.livestreamId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            wonSide: wonSide ?? this.wonSide,
            declarationDate: declarationDate ?? this.declarationDate,
            declarationBy: declarationBy ?? this.declarationBy,
            isDeclaredResult: isDeclaredResult ?? this.isDeclaredResult,
            streamerFee: streamerFee ?? this.streamerFee,
            total: total ?? this.total,
            isAddBet: isAddBet ?? this.isAddBet,
            isClaimBet: isClaimBet ?? this.isClaimBet,
            master: master ?? this.master,
            user: user ?? this.user,
            bets: bets ?? this.bets,
        );
    }

    factory ActiveBet.fromJson(Map<String, dynamic> json) => _$ActiveBetFromJson(json);

    Map<String, dynamic> toJson() => _$ActiveBetToJson(this);

    @override
    String toString(){
        return "$id, $bettingAmount, $forText, $againstText, $description, $masterBettingId, $userId, $livestreamId, $createdAt, $updatedAt, $wonSide, $declarationDate, $declarationBy, $isDeclaredResult, $streamerFee, $total, $isAddBet, $isClaimBet, $master, $user, $bets, ";
    }

    @override
    List<Object?> get props => [
    id, bettingAmount, forText, againstText, description, masterBettingId, userId, livestreamId, createdAt, updatedAt, wonSide, declarationDate, declarationBy, isDeclaredResult, streamerFee, total, isAddBet, isClaimBet, master, user, bets, ];
}

@JsonSerializable()
class Bet extends Equatable {
    Bet({
        required this.id,
        required this.userId,
        required this.gameId,
        required this.gameName,
        required this.amount,
        required this.createdAt,
        required this.updatedAt,
        required this.totalAmount,
        required this.betMainId,
        required this.claimedDate,
        required this.isClaimed,
        required this.isWin,
        required this.winAmount,
        required this.betOn,
        required this.vigAmount,
    });

    final int? id;
    static const String idKey = "id";
    

    @JsonKey(name: 'user_id') 
    final String? userId;
    static const String userIdKey = "user_id";
    

    @JsonKey(name: 'game_id') 
    final String? gameId;
    static const String gameIdKey = "game_id";
    

    @JsonKey(name: 'game_name') 
    final String? gameName;
    static const String gameNameKey = "game_name";
    
    final String? amount;
    static const String amountKey = "amount";
    

    @JsonKey(name: 'created_at') 
    final DateTime? createdAt;
    static const String createdAtKey = "created_at";
    

    @JsonKey(name: 'updated_at') 
    final DateTime? updatedAt;
    static const String updatedAtKey = "updated_at";
    

    @JsonKey(name: 'total_amount') 
    final String? totalAmount;
    static const String totalAmountKey = "total_amount";
    

    @JsonKey(name: 'bet_main_id') 
    final int? betMainId;
    static const String betMainIdKey = "bet_main_id";
    

    @JsonKey(name: 'claimed_date') 
    final DateTime? claimedDate;
    static const String claimedDateKey = "claimed_date";
    

    @JsonKey(name: 'is_claimed') 
    final int? isClaimed;
    static const String isClaimedKey = "is_claimed";
    

    @JsonKey(name: 'is_win') 
    final int? isWin;
    static const String isWinKey = "is_win";
    

    @JsonKey(name: 'win_amount') 
    final dynamic winAmount;
    static const String winAmountKey = "win_amount";
    

    @JsonKey(name: 'bet_on') 
    final String? betOn;
    static const String betOnKey = "bet_on";
    

    @JsonKey(name: 'vig_amount') 
    final String? vigAmount;
    static const String vigAmountKey = "vig_amount";
    

    Bet copyWith({
        int? id,
        String? userId,
        String? gameId,
        String? gameName,
        String? amount,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? totalAmount,
        int? betMainId,
        DateTime? claimedDate,
        int? isClaimed,
        int? isWin,
        dynamic winAmount,
        String? betOn,
        String? vigAmount,
    }) {
        return Bet(
            id: id ?? this.id,
            userId: userId ?? this.userId,
            gameId: gameId ?? this.gameId,
            gameName: gameName ?? this.gameName,
            amount: amount ?? this.amount,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            totalAmount: totalAmount ?? this.totalAmount,
            betMainId: betMainId ?? this.betMainId,
            claimedDate: claimedDate ?? this.claimedDate,
            isClaimed: isClaimed ?? this.isClaimed,
            isWin: isWin ?? this.isWin,
            winAmount: winAmount ?? this.winAmount,
            betOn: betOn ?? this.betOn,
            vigAmount: vigAmount ?? this.vigAmount,
        );
    }

    factory Bet.fromJson(Map<String, dynamic> json) => _$BetFromJson(json);

    Map<String, dynamic> toJson() => _$BetToJson(this);

    @override
    String toString(){
        return "$id, $userId, $gameId, $gameName, $amount, $createdAt, $updatedAt, $totalAmount, $betMainId, $claimedDate, $isClaimed, $isWin, $winAmount, $betOn, $vigAmount, ";
    }

    @override
    List<Object?> get props => [
    id, userId, gameId, gameName, amount, createdAt, updatedAt, totalAmount, betMainId, claimedDate, isClaimed, isWin, winAmount, betOn, vigAmount, ];
}

@JsonSerializable()
class Master extends Equatable {
    Master({
        required this.id,
        required this.description,
        required this.addedBy,
        required this.bettingAmount,
        required this.createdAt,
        required this.updatedAt,
        required this.isActive,
    });

    final int? id;
    static const String idKey = "id";
    
    final String? description;
    static const String descriptionKey = "description";
    

    @JsonKey(name: 'added_by') 
    final int? addedBy;
    static const String addedByKey = "added_by";
    

    @JsonKey(name: 'betting_amount') 
    final String? bettingAmount;
    static const String bettingAmountKey = "betting_amount";
    

    @JsonKey(name: 'created_at') 
    final DateTime? createdAt;
    static const String createdAtKey = "created_at";
    

    @JsonKey(name: 'updated_at') 
    final DateTime? updatedAt;
    static const String updatedAtKey = "updated_at";
    

    @JsonKey(name: 'is_active') 
    final int? isActive;
    static const String isActiveKey = "is_active";
    

    Master copyWith({
        int? id,
        String? description,
        int? addedBy,
        String? bettingAmount,
        DateTime? createdAt,
        DateTime? updatedAt,
        int? isActive,
    }) {
        return Master(
            id: id ?? this.id,
            description: description ?? this.description,
            addedBy: addedBy ?? this.addedBy,
            bettingAmount: bettingAmount ?? this.bettingAmount,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            isActive: isActive ?? this.isActive,
        );
    }

    factory Master.fromJson(Map<String, dynamic> json) => _$MasterFromJson(json);

    Map<String, dynamic> toJson() => _$MasterToJson(this);

    @override
    String toString(){
        return "$id, $description, $addedBy, $bettingAmount, $createdAt, $updatedAt, $isActive, ";
    }

    @override
    List<Object?> get props => [
    id, description, addedBy, bettingAmount, createdAt, updatedAt, isActive, ];
}

@JsonSerializable()
class User extends Equatable {
    User({
        required this.id,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.username,
        required this.phone,
        required this.businessInfo,
        required this.profile,
        required this.address,
        required this.rememberToken,
        required this.eloBalance,
        required this.createdAt,
        required this.updatedAt,
        required this.userType,
        required this.status,
        required this.paypalEmail,
        required this.streamKey,
        required this.dateOfBirth,
        required this.userAge,
        required this.agree,
        required this.imageLink,
        required this.name,
    });

    final int? id;
    static const String idKey = "id";
    
    final String? email;
    static const String emailKey = "email";
    
    final String? firstName;
    static const String firstNameKey = "firstName";
    
    final String? lastName;
    static const String lastNameKey = "lastName";
    
    final String? username;
    static const String usernameKey = "username";
    
    final String? phone;
    static const String phoneKey = "phone";
    

    @JsonKey(name: 'business_info') 
    final dynamic businessInfo;
    static const String businessInfoKey = "business_info";
    
    final String? profile;
    static const String profileKey = "profile";
    
    final String? address;
    static const String addressKey = "address";
    

    @JsonKey(name: 'remember_token') 
    final dynamic rememberToken;
    static const String rememberTokenKey = "remember_token";
    

    @JsonKey(name: 'elo_balance') 
    final int? eloBalance;
    static const String eloBalanceKey = "elo_balance";
    

    @JsonKey(name: 'created_at') 
    final DateTime? createdAt;
    static const String createdAtKey = "created_at";
    

    @JsonKey(name: 'updated_at') 
    final DateTime? updatedAt;
    static const String updatedAtKey = "updated_at";
    

    @JsonKey(name: 'user_type') 
    final dynamic userType;
    static const String userTypeKey = "user_type";
    
    final int? status;
    static const String statusKey = "status";
    

    @JsonKey(name: 'paypal_email') 
    final dynamic paypalEmail;
    static const String paypalEmailKey = "paypal_email";
    

    @JsonKey(name: 'stream_key') 
    final String? streamKey;
    static const String streamKeyKey = "stream_key";
    

    @JsonKey(name: 'date_of_birth') 
    final DateTime? dateOfBirth;
    static const String dateOfBirthKey = "date_of_birth";
    

    @JsonKey(name: 'user_age') 
    final String? userAge;
    static const String userAgeKey = "user_age";
    
    final dynamic agree;
    static const String agreeKey = "agree";
    
    final String? imageLink;
    static const String imageLinkKey = "imageLink";
    
    final String? name;
    static const String nameKey = "name";
    

    User copyWith({
        int? id,
        String? email,
        String? firstName,
        String? lastName,
        String? username,
        String? phone,
        dynamic businessInfo,
        String? profile,
        String? address,
        dynamic rememberToken,
        int? eloBalance,
        DateTime? createdAt,
        DateTime? updatedAt,
        dynamic userType,
        int? status,
        dynamic paypalEmail,
        String? streamKey,
        DateTime? dateOfBirth,
        String? userAge,
        dynamic agree,
        String? imageLink,
        String? name,
    }) {
        return User(
            id: id ?? this.id,
            email: email ?? this.email,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            username: username ?? this.username,
            phone: phone ?? this.phone,
            businessInfo: businessInfo ?? this.businessInfo,
            profile: profile ?? this.profile,
            address: address ?? this.address,
            rememberToken: rememberToken ?? this.rememberToken,
            eloBalance: eloBalance ?? this.eloBalance,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            userType: userType ?? this.userType,
            status: status ?? this.status,
            paypalEmail: paypalEmail ?? this.paypalEmail,
            streamKey: streamKey ?? this.streamKey,
            dateOfBirth: dateOfBirth ?? this.dateOfBirth,
            userAge: userAge ?? this.userAge,
            agree: agree ?? this.agree,
            imageLink: imageLink ?? this.imageLink,
            name: name ?? this.name,
        );
    }

    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

    Map<String, dynamic> toJson() => _$UserToJson(this);

    @override
    String toString(){
        return "$id, $email, $firstName, $lastName, $username, $phone, $businessInfo, $profile, $address, $rememberToken, $eloBalance, $createdAt, $updatedAt, $userType, $status, $paypalEmail, $streamKey, $dateOfBirth, $userAge, $agree, $imageLink, $name, ";
    }

    @override
    List<Object?> get props => [
    id, email, firstName, lastName, username, phone, businessInfo, profile, address, rememberToken, eloBalance, createdAt, updatedAt, userType, status, paypalEmail, streamKey, dateOfBirth, userAge, agree, imageLink, name, ];
}

@JsonSerializable()
class ChkLabel extends Equatable {
    ChkLabel({
        required this.id,
        required this.username,
        required this.lableGame,
        required this.createdAt,
        required this.updatedAt,
        required this.userId,
        required this.labelGame,
    });

    final int? id;
    static const String idKey = "id";
    
    final String? username;
    static const String usernameKey = "username";
    

    @JsonKey(name: 'lable_game') 
    final dynamic lableGame;
    static const String lableGameKey = "lable_game";
    

    @JsonKey(name: 'created_at') 
    final DateTime? createdAt;
    static const String createdAtKey = "created_at";
    

    @JsonKey(name: 'updated_at') 
    final DateTime? updatedAt;
    static const String updatedAtKey = "updated_at";
    

    @JsonKey(name: 'user_id') 
    final int? userId;
    static const String userIdKey = "user_id";
    

    @JsonKey(name: 'label_game') 
    final String? labelGame;
    static const String labelGameKey = "label_game";
    

    ChkLabel copyWith({
        int? id,
        String? username,
        dynamic lableGame,
        DateTime? createdAt,
        DateTime? updatedAt,
        int? userId,
        String? labelGame,
    }) {
        return ChkLabel(
            id: id ?? this.id,
            username: username ?? this.username,
            lableGame: lableGame ?? this.lableGame,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            userId: userId ?? this.userId,
            labelGame: labelGame ?? this.labelGame,
        );
    }

    factory ChkLabel.fromJson(Map<String, dynamic> json) => _$ChkLabelFromJson(json);

    Map<String, dynamic> toJson() => _$ChkLabelToJson(this);

    @override
    String toString(){
        return "$id, $username, $lableGame, $createdAt, $updatedAt, $userId, $labelGame, ";
    }

    @override
    List<Object?> get props => [
    id, username, lableGame, createdAt, updatedAt, userId, labelGame, ];
}

@JsonSerializable()
class Conversion extends Equatable {
    Conversion({
        required this.cid,
        required this.elo,
        required this.usdAmt,
        required this.createdAt,
        required this.updatedAt,
    });

    final int? cid;
    static const String cidKey = "cid";
    
    final int? elo;
    static const String eloKey = "elo";
    

    @JsonKey(name: 'usd_amt') 
    final int? usdAmt;
    static const String usdAmtKey = "usd_amt";
    

    @JsonKey(name: 'created_at') 
    final dynamic createdAt;
    static const String createdAtKey = "created_at";
    

    @JsonKey(name: 'updated_at') 
    final dynamic updatedAt;
    static const String updatedAtKey = "updated_at";
    

    Conversion copyWith({
        int? cid,
        int? elo,
        int? usdAmt,
        dynamic createdAt,
        dynamic updatedAt,
    }) {
        return Conversion(
            cid: cid ?? this.cid,
            elo: elo ?? this.elo,
            usdAmt: usdAmt ?? this.usdAmt,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );
    }

    factory Conversion.fromJson(Map<String, dynamic> json) => _$ConversionFromJson(json);

    Map<String, dynamic> toJson() => _$ConversionToJson(this);

    @override
    String toString(){
        return "$cid, $elo, $usdAmt, $createdAt, $updatedAt, ";
    }

    @override
    List<Object?> get props => [
    cid, elo, usdAmt, createdAt, updatedAt, ];
}

@JsonSerializable()
class Livestream extends Equatable {
    Livestream({
        required this.id,
        required this.userId,
        required this.streamId,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.name,
        required this.image,
        required this.description,
        required this.delayTime,
        required this.viewCounter,
        required this.type,
        required this.fileLink,
    });

    final int? id;
    static const String idKey = "id";
    

    @JsonKey(name: 'user_id') 
    final int? userId;
    static const String userIdKey = "user_id";
    

    @JsonKey(name: 'stream_id') 
    final String? streamId;
    static const String streamIdKey = "stream_id";
    
    final String? status;
    static const String statusKey = "status";
    

    @JsonKey(name: 'created_at') 
    final DateTime? createdAt;
    static const String createdAtKey = "created_at";
    

    @JsonKey(name: 'updated_at') 
    final DateTime? updatedAt;
    static const String updatedAtKey = "updated_at";
    
    final String? name;
    static const String nameKey = "name";
    
    final String? image;
    static const String imageKey = "image";
    
    final String? description;
    static const String descriptionKey = "description";
    

    @JsonKey(name: 'delay_time') 
    final String? delayTime;
    static const String delayTimeKey = "delay_time";
    

    @JsonKey(name: 'view_counter') 
    final dynamic viewCounter;
    static const String viewCounterKey = "view_counter";
    
    final dynamic type;
    static const String typeKey = "type";
    
    final bool? fileLink;
    static const String fileLinkKey = "fileLink";
    

    Livestream copyWith({
        int? id,
        int? userId,
        String? streamId,
        String? status,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? name,
        String? image,
        String? description,
        String? delayTime,
        dynamic viewCounter,
        dynamic type,
        bool? fileLink,
    }) {
        return Livestream(
            id: id ?? this.id,
            userId: userId ?? this.userId,
            streamId: streamId ?? this.streamId,
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            name: name ?? this.name,
            image: image ?? this.image,
            description: description ?? this.description,
            delayTime: delayTime ?? this.delayTime,
            viewCounter: viewCounter ?? this.viewCounter,
            type: type ?? this.type,
            fileLink: fileLink ?? this.fileLink,
        );
    }

    factory Livestream.fromJson(Map<String, dynamic> json) => _$LivestreamFromJson(json);

    Map<String, dynamic> toJson() => _$LivestreamToJson(this);

    @override
    String toString(){
        return "$id, $userId, $streamId, $status, $createdAt, $updatedAt, $name, $image, $description, $delayTime, $viewCounter, $type, $fileLink, ";
    }

    @override
    List<Object?> get props => [
    id, userId, streamId, status, createdAt, updatedAt, name, image, description, delayTime, viewCounter, type, fileLink, ];
}

@JsonSerializable()
class Setting extends Equatable {
    Setting({
        required this.id,
        required this.vig,
        required this.extraVigDivisionFactor,
        required this.updatedAt,
        required this.noOfUserCanBet,
        required this.streamerPer,
        required this.minWalletTrasferAmount,
        required this.clientId,
        required this.apiUsername,
        required this.apiPassword,
        required this.apiSignature,
        required this.environment,
        required this.hideTwitchStream,
    });

    final int? id;
    static const String idKey = "id";
    
    final String? vig;
    static const String vigKey = "vig";
    

    @JsonKey(name: 'extra_vig_division_factor') 
    final int? extraVigDivisionFactor;
    static const String extraVigDivisionFactorKey = "extra_vig_division_factor";
    

    @JsonKey(name: 'updated_at') 
    final DateTime? updatedAt;
    static const String updatedAtKey = "updated_at";
    

    @JsonKey(name: 'no_of_user_can_bet') 
    final int? noOfUserCanBet;
    static const String noOfUserCanBetKey = "no_of_user_can_bet";
    

    @JsonKey(name: 'streamer_per') 
    final int? streamerPer;
    static const String streamerPerKey = "streamer_per";
    

    @JsonKey(name: 'min_wallet_trasfer_amount') 
    final String? minWalletTrasferAmount;
    static const String minWalletTrasferAmountKey = "min_wallet_trasfer_amount";
    

    @JsonKey(name: 'client_id') 
    final String? clientId;
    static const String clientIdKey = "client_id";
    

    @JsonKey(name: 'api_username') 
    final String? apiUsername;
    static const String apiUsernameKey = "api_username";
    

    @JsonKey(name: 'api_password') 
    final String? apiPassword;
    static const String apiPasswordKey = "api_password";
    

    @JsonKey(name: 'api_signature') 
    final String? apiSignature;
    static const String apiSignatureKey = "api_signature";
    
    final String? environment;
    static const String environmentKey = "environment";
    

    @JsonKey(name: 'hide_twitch_stream') 
    final int? hideTwitchStream;
    static const String hideTwitchStreamKey = "hide_twitch_stream";
    

    Setting copyWith({
        int? id,
        String? vig,
        int? extraVigDivisionFactor,
        DateTime? updatedAt,
        int? noOfUserCanBet,
        int? streamerPer,
        String? minWalletTrasferAmount,
        String? clientId,
        String? apiUsername,
        String? apiPassword,
        String? apiSignature,
        String? environment,
        int? hideTwitchStream,
    }) {
        return Setting(
            id: id ?? this.id,
            vig: vig ?? this.vig,
            extraVigDivisionFactor: extraVigDivisionFactor ?? this.extraVigDivisionFactor,
            updatedAt: updatedAt ?? this.updatedAt,
            noOfUserCanBet: noOfUserCanBet ?? this.noOfUserCanBet,
            streamerPer: streamerPer ?? this.streamerPer,
            minWalletTrasferAmount: minWalletTrasferAmount ?? this.minWalletTrasferAmount,
            clientId: clientId ?? this.clientId,
            apiUsername: apiUsername ?? this.apiUsername,
            apiPassword: apiPassword ?? this.apiPassword,
            apiSignature: apiSignature ?? this.apiSignature,
            environment: environment ?? this.environment,
            hideTwitchStream: hideTwitchStream ?? this.hideTwitchStream,
        );
    }

    factory Setting.fromJson(Map<String, dynamic> json) => _$SettingFromJson(json);

    Map<String, dynamic> toJson() => _$SettingToJson(this);

    @override
    String toString(){
        return "$id, $vig, $extraVigDivisionFactor, $updatedAt, $noOfUserCanBet, $streamerPer, $minWalletTrasferAmount, $clientId, $apiUsername, $apiPassword, $apiSignature, $environment, $hideTwitchStream, ";
    }

    @override
    List<Object?> get props => [
    id, vig, extraVigDivisionFactor, updatedAt, noOfUserCanBet, streamerPer, minWalletTrasferAmount, clientId, apiUsername, apiPassword, apiSignature, environment, hideTwitchStream, ];
}
