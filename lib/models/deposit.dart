import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'deposit.g.dart';

@JsonSerializable()
class Deposit extends Equatable {
    Deposit({
        required this.status,
        required this.deposits,
    });

    final String? status;
    static const String statusKey = "status";
    
    final List<DepositElement>? deposits;
    static const String depositsKey = "deposits";
    

    Deposit copyWith({
        String? status,
        List<DepositElement>? deposits,
    }) {
        return Deposit(
            status: status ?? this.status,
            deposits: deposits ?? this.deposits,
        );
    }

    factory Deposit.fromJson(Map<String, dynamic> json) => _$DepositFromJson(json);

    Map<String, dynamic> toJson() => _$DepositToJson(this);

    @override
    String toString(){
        return "$status, $deposits, ";
    }

    @override
    List<Object?> get props => [
    status, deposits, ];
}

@JsonSerializable()
class DepositElement extends Equatable {
    DepositElement({
        required this.depositedAmount,
        required this.transactionId,
        required this.status,
        required this.date,
    });

    @JsonKey(name: 'Deposited Amount') 
    final String? depositedAmount;
    static const String depositedAmountKey = "Deposited Amount";
    

    @JsonKey(name: 'Transaction Id') 
    final dynamic transactionId;
    static const String transactionIdKey = "Transaction Id";
    

    @JsonKey(name: 'Status') 
    final String? status;
    static const String statusKey = "Status";
    

    @JsonKey(name: 'Date') 
    final DateTime? date;
    static const String dateKey = "Date";
    

    DepositElement copyWith({
        String? depositedAmount,
        dynamic? transactionId,
        String? status,
        DateTime? date,
    }) {
        return DepositElement(
            depositedAmount: depositedAmount ?? this.depositedAmount,
            transactionId: transactionId ?? this.transactionId,
            status: status ?? this.status,
            date: date ?? this.date,
        );
    }

    factory DepositElement.fromJson(Map<String, dynamic> json) => _$DepositElementFromJson(json);

    Map<String, dynamic> toJson() => _$DepositElementToJson(this);

    @override
    String toString(){
        return "$depositedAmount, $transactionId, $status, $date, ";
    }

    @override
    List<Object?> get props => [
    depositedAmount, transactionId, status, date, ];
}
