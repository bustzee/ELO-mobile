import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'withdrawal.g.dart';

@JsonSerializable()
class Withdrawal extends Equatable {
    Withdrawal({
        required this.status,
        required this.withdrawals,
    });

    final String? status;
    static const String statusKey = "status";
    
    final List<WithdrawalElement>? withdrawals;
    static const String withdrawalsKey = "withdrawals";
    

    Withdrawal copyWith({
        String? status,
        List<WithdrawalElement>? withdrawals,
    }) {
        return Withdrawal(
            status: status ?? this.status,
            withdrawals: withdrawals ?? this.withdrawals,
        );
    }

    factory Withdrawal.fromJson(Map<String, dynamic> json) => _$WithdrawalFromJson(json);

    Map<String, dynamic> toJson() => _$WithdrawalToJson(this);

    @override
    String toString(){
        return "$status, $withdrawals, ";
    }

    @override
    List<Object?> get props => [
    status, withdrawals, ];
}

@JsonSerializable()
class WithdrawalElement extends Equatable {
    WithdrawalElement({
        required this.comment,
        required this.transactionAmount,
        required this.transactionIdEmailId,
        required this.type,
        required this.onDate,
    });

    @JsonKey(name: 'Comment') 
    final String? comment;
    static const String commentKey = "Comment";
    

    @JsonKey(name: 'transaction_amount') 
    final String? transactionAmount;
    static const String transactionAmountKey = "transaction_amount";
    

    @JsonKey(name: 'Transaction Id / Email Id') 
    final String? transactionIdEmailId;
    static const String transactionIdEmailIdKey = "Transaction Id / Email Id";
    

    @JsonKey(name: 'Type') 
    final String? type;
    static const String typeKey = "Type";
    

    @JsonKey(name: 'On Date') 
    final String? onDate;
    static const String onDateKey = "On Date";
    

    WithdrawalElement copyWith({
        String? comment,
        String? transactionAmount,
        String? transactionIdEmailId,
        String? type,
        String? onDate,
    }) {
        return WithdrawalElement(
            comment: comment ?? this.comment,
            transactionAmount: transactionAmount ?? this.transactionAmount,
            transactionIdEmailId: transactionIdEmailId ?? this.transactionIdEmailId,
            type: type ?? this.type,
            onDate: onDate ?? this.onDate,
        );
    }

    factory WithdrawalElement.fromJson(Map<String, dynamic> json) => _$WithdrawalElementFromJson(json);

    Map<String, dynamic> toJson() => _$WithdrawalElementToJson(this);

    @override
    String toString(){
        return "$comment, $transactionAmount, $transactionIdEmailId, $type, $onDate, ";
    }

    @override
    List<Object?> get props => [
    comment, transactionAmount, transactionIdEmailId, type, onDate, ];
}
