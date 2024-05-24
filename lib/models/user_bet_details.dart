import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_bet_details.g.dart';

@JsonSerializable()
class UserBetDetails extends Equatable {
    UserBetDetails({
        required this.status,
        required this.data,
    });

    final String? status;
    static const String statusKey = "status";
    
    final Data? data;
    static const String dataKey = "data";
    

    UserBetDetails copyWith({
        String? status,
        Data? data,
    }) {
        return UserBetDetails(
            status: status ?? this.status,
            data: data ?? this.data,
        );
    }

    factory UserBetDetails.fromJson(Map<String, dynamic> json) => _$UserBetDetailsFromJson(json);

    Map<String, dynamic> toJson() => _$UserBetDetailsToJson(this);

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
        required this.userBets,
    });

    @JsonKey(name: 'user_bets') 
    final List<UserBet>? userBets;
    static const String userBetsKey = "user_bets";
    

    Data copyWith({
        List<UserBet>? userBets,
    }) {
        return Data(
            userBets: userBets ?? this.userBets,
        );
    }

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);

    @override
    String toString(){
        return "$userBets, ";
    }

    @override
    List<Object?> get props => [
    userBets, ];
}

@JsonSerializable()
class UserBet extends Equatable {
    UserBet({
        required this.betMainId,
        required this.gameId,
        required this.amount,
        required this.isClaimed,
        required this.claimedDate,
        required this.betDetails,
    });

    @JsonKey(name: 'bet_main_id') 
    final int? betMainId;
    static const String betMainIdKey = "bet_main_id";
    

    @JsonKey(name: 'game_id') 
    final String? gameId;
    static const String gameIdKey = "game_id";
    
    final String? amount;
    static const String amountKey = "amount";
    

    @JsonKey(name: 'is_claimed') 
    int? isClaimed;
    static const String isClaimedKey = "is_claimed";
    

    @JsonKey(name: 'claimed_date') 
    final DateTime? claimedDate;
    static const String claimedDateKey = "claimed_date";
    

    @JsonKey(name: 'bet_details') 
    final BetDetails? betDetails;
    static const String betDetailsKey = "bet_details";
    

    UserBet copyWith({
        int? betMainId,
        String? gameId,
        String? amount,
        int? isClaimed,
        DateTime? claimedDate,
        BetDetails? betDetails,
    }) {
        return UserBet(
            betMainId: betMainId ?? this.betMainId,
            gameId: gameId ?? this.gameId,
            amount: amount ?? this.amount,
            isClaimed: isClaimed ?? this.isClaimed,
            claimedDate: claimedDate ?? this.claimedDate,
            betDetails: betDetails ?? this.betDetails,
        );
    }

    factory UserBet.fromJson(Map<String, dynamic> json) => _$UserBetFromJson(json);

    Map<String, dynamic> toJson() => _$UserBetToJson(this);

    @override
    String toString(){
        return "$betMainId, $gameId, $amount, $isClaimed, $claimedDate, $betDetails, ";
    }

    @override
    List<Object?> get props => [
    betMainId, gameId, amount, isClaimed, claimedDate, betDetails, ];
}

@JsonSerializable()
class BetDetails extends Equatable {
    BetDetails({
        required this.betType,
        required this.description,
        required this.betFor,
        required this.betAgainst,
        required this.winningAmount,
        required this.status,
        required this.user,
    });

    @JsonKey(name: 'bet_type') 
    final String? betType;
    static const String betTypeKey = "bet_type";
    
    final String? description;
    static const String descriptionKey = "description";
    

    @JsonKey(name: 'bet_for') 
    final String? betFor;
    static const String betForKey = "bet_for";
    

    @JsonKey(name: 'bet_against') 
    final String? betAgainst;
    static const String betAgainstKey = "bet_against";
    

    @JsonKey(name: 'winning_amount') 
    final String? winningAmount;
    static const String winningAmountKey = "winning_amount";
    
    final dynamic status;
    static const String statusKey = "status";
    
    final User? user;
    static const String userKey = "user";
    

    BetDetails copyWith({
        String? betType,
        String? description,
        String? betFor,
        String? betAgainst,
        String? winningAmount,
        dynamic? status,
        User? user,
    }) {
        return BetDetails(
            betType: betType ?? this.betType,
            description: description ?? this.description,
            betFor: betFor ?? this.betFor,
            betAgainst: betAgainst ?? this.betAgainst,
            winningAmount: winningAmount ?? this.winningAmount,
            status: status ?? this.status,
            user: user ?? this.user,
        );
    }

    factory BetDetails.fromJson(Map<String, dynamic> json) => _$BetDetailsFromJson(json);

    Map<String, dynamic> toJson() => _$BetDetailsToJson(this);

    @override
    String toString(){
        return "$betType, $description, $betFor, $betAgainst, $winningAmount, $status, $user, ";
    }

    @override
    List<Object?> get props => [
    betType, description, betFor, betAgainst, winningAmount, status, user, ];
}

@JsonSerializable()
class User extends Equatable {
    User({
        required this.username,
        required this.betOn,
        required this.betAmount,
        required this.createdOn,
        required this.winningAmount,
    });

    final String? username;
    static const String usernameKey = "username";
    

    @JsonKey(name: 'bet_on') 
    final String? betOn;
    static const String betOnKey = "bet_on";
    

    @JsonKey(name: 'bet_amount') 
    final String? betAmount;
    static const String betAmountKey = "bet_amount";
    

    @JsonKey(name: 'created_on') 
    final DateTime? createdOn;
    static const String createdOnKey = "created_on";
    

    @JsonKey(name: 'winning_amount') 
    final dynamic winningAmount;
    static const String winningAmountKey = "winning_amount";
    

    User copyWith({
        String? username,
        String? betOn,
        String? betAmount,
        DateTime? createdOn,
        dynamic? winningAmount,
    }) {
        return User(
            username: username ?? this.username,
            betOn: betOn ?? this.betOn,
            betAmount: betAmount ?? this.betAmount,
            createdOn: createdOn ?? this.createdOn,
            winningAmount: winningAmount ?? this.winningAmount,
        );
    }

    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

    Map<String, dynamic> toJson() => _$UserToJson(this);

    @override
    String toString(){
        return "$username, $betOn, $betAmount, $createdOn, $winningAmount, ";
    }

    @override
    List<Object?> get props => [
    username, betOn, betAmount, createdOn, winningAmount, ];
}
