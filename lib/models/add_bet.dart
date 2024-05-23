import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_bet.g.dart';

@JsonSerializable()
class BetDetails extends Equatable {
    BetDetails({
        required this.gameId,
        required this.bettingId,
        required this.customAmount,
        required this.forText,
        required this.againstText,
        required this.description,
    });

    @JsonKey(name: 'game_id') 
    final int? gameId;
    static const String gameIdKey = "game_id";
    

    @JsonKey(name: 'betting_id') 
    final String? bettingId;
    static const String bettingIdKey = "betting_id";
    

    @JsonKey(name: 'custom_amount') 
    final int? customAmount;
    static const String customAmountKey = "custom_amount";
    

    @JsonKey(name: 'for_text') 
    final String? forText;
    static const String forTextKey = "for_text";
    

    @JsonKey(name: 'against_text') 
    final String? againstText;
    static const String againstTextKey = "against_text";
    
    final String? description;
    static const String descriptionKey = "description";
    

    BetDetails copyWith({
        int? gameId,
        String? bettingId,
        int? customAmount,
        String? forText,
        String? againstText,
        String? description,
    }) {
        return BetDetails(
            gameId: gameId ?? this.gameId,
            bettingId: bettingId ?? this.bettingId,
            customAmount: customAmount ?? this.customAmount,
            forText: forText ?? this.forText,
            againstText: againstText ?? this.againstText,
            description: description ?? this.description,
        );
    }

    factory BetDetails.fromJson(Map<String, dynamic> json) => _$BetDetailsFromJson(json);

    Map<String, dynamic> toJson() => _$BetDetailsToJson(this);

    @override
    String toString(){
        return "$gameId, $bettingId, $customAmount, $forText, $againstText, $description, ";
    }

    @override
    List<Object?> get props => [
    gameId, bettingId, customAmount, forText, againstText, description, ];
}
