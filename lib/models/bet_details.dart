import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bet_details.g.dart';

@JsonSerializable()
class BetDetails extends Equatable {
    BetDetails({
        required this.status,
        required this.data,
    });

    final String? status;
    static const String statusKey = "status";
    
    final Data? data;
    static const String dataKey = "data";
    

    BetDetails copyWith({
        String? status,
        Data? data,
    }) {
        return BetDetails(
            status: status ?? this.status,
            data: data ?? this.data,
        );
    }

    factory BetDetails.fromJson(Map<String, dynamic> json) => _$BetDetailsFromJson(json);

    Map<String, dynamic> toJson() => _$BetDetailsToJson(this);

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
        required this.streamName,
        required this.description,
        required this.potAmount,
        required this.bets,
    });

    @JsonKey(name: 'stream_name') 
    final String? streamName;
    static const String streamNameKey = "stream_name";
    
    final String? description;
    static const String descriptionKey = "description";
    

    @JsonKey(name: 'pot_amount') 
    final int? potAmount;
    static const String potAmountKey = "pot_amount";
    
    final List<Bet>? bets;
    static const String betsKey = "bets";
    

    Data copyWith({
        String? streamName,
        String? description,
        int? potAmount,
        List<Bet>? bets,
    }) {
        return Data(
            streamName: streamName ?? this.streamName,
            description: description ?? this.description,
            potAmount: potAmount ?? this.potAmount,
            bets: bets ?? this.bets,
        );
    }

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);

    @override
    String toString(){
        return "$streamName, $description, $potAmount, $bets, ";
    }

    @override
    List<Object?> get props => [
    streamName, description, potAmount, bets, ];
}

@JsonSerializable()
class Bet extends Equatable {
    Bet({
        required this.betType,
        required this.description,
        required this.betFor,
        required this.betAgainst,
        required this.winningAmount,
        required this.noOfBets,
        required this.activeHours,
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
    

    @JsonKey(name: 'no_of_bets') 
    final String? noOfBets;
    static const String noOfBetsKey = "no_of_bets";
    

    @JsonKey(name: 'active_hours') 
    final String? activeHours;
    static const String activeHoursKey = "active_hours";
    
    final dynamic status;
    static const String statusKey = "status";
    
    final User? user;
    static const String userKey = "user";
    

    Bet copyWith({
        String? betType,
        String? description,
        String? betFor,
        String? betAgainst,
        String? winningAmount,
        String? noOfBets,
        String? activeHours,
        dynamic? status,
        User? user,
    }) {
        return Bet(
            betType: betType ?? this.betType,
            description: description ?? this.description,
            betFor: betFor ?? this.betFor,
            betAgainst: betAgainst ?? this.betAgainst,
            winningAmount: winningAmount ?? this.winningAmount,
            noOfBets: noOfBets ?? this.noOfBets,
            activeHours: activeHours ?? this.activeHours,
            status: status ?? this.status,
            user: user ?? this.user,
        );
    }

    factory Bet.fromJson(Map<String, dynamic> json) => _$BetFromJson(json);

    Map<String, dynamic> toJson() => _$BetToJson(this);

    @override
    String toString(){
        return "$betType, $description, $betFor, $betAgainst, $winningAmount, $noOfBets, $activeHours, $status, $user, ";
    }

    @override
    List<Object?> get props => [
    betType, description, betFor, betAgainst, winningAmount, noOfBets, activeHours, status, user, ];
}

@JsonSerializable()
class User extends Equatable {
    User({
        required this.username,
        required this.betOn,
        required this.betAmount,
        required this.vig,
        required this.total,
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
    
    final String? vig;
    static const String vigKey = "vig";
    
    final int? total;
    static const String totalKey = "total";
    

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
        String? vig,
        int? total,
        DateTime? createdOn,
        dynamic? winningAmount,
    }) {
        return User(
            username: username ?? this.username,
            betOn: betOn ?? this.betOn,
            betAmount: betAmount ?? this.betAmount,
            vig: vig ?? this.vig,
            total: total ?? this.total,
            createdOn: createdOn ?? this.createdOn,
            winningAmount: winningAmount ?? this.winningAmount,
        );
    }

    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

    Map<String, dynamic> toJson() => _$UserToJson(this);

    @override
    String toString(){
        return "$username, $betOn, $betAmount, $vig, $total, $createdOn, $winningAmount, ";
    }

    @override
    List<Object?> get props => [
    username, betOn, betAmount, vig, total, createdOn, winningAmount, ];
}
