// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Withdrawal _$WithdrawalFromJson(Map<String, dynamic> json) => Withdrawal(
      status: json['status'] as String?,
      withdrawals: (json['withdrawals'] as List<dynamic>?)
          ?.map((e) => WithdrawalElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WithdrawalToJson(Withdrawal instance) =>
    <String, dynamic>{
      'status': instance.status,
      'withdrawals': instance.withdrawals,
    };

WithdrawalElement _$WithdrawalElementFromJson(Map<String, dynamic> json) =>
    WithdrawalElement(
      comment: json['Comment'] as String?,
      transactionAmount: json['transaction_amount'] as String?,
      transactionIdEmailId: json['Transaction Id / Email Id'] as String?,
      type: json['Type'] as String?,
      onDate: json['On Date'] as String?,
    );

Map<String, dynamic> _$WithdrawalElementToJson(WithdrawalElement instance) =>
    <String, dynamic>{
      'Comment': instance.comment,
      'transaction_amount': instance.transactionAmount,
      'Transaction Id / Email Id': instance.transactionIdEmailId,
      'Type': instance.type,
      'On Date': instance.onDate,
    };
