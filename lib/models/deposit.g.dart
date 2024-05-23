// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Deposit _$DepositFromJson(Map<String, dynamic> json) => Deposit(
      status: json['status'] as String?,
      deposits: (json['deposits'] as List<dynamic>?)
          ?.map((e) => DepositElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DepositToJson(Deposit instance) => <String, dynamic>{
      'status': instance.status,
      'deposits': instance.deposits,
    };

DepositElement _$DepositElementFromJson(Map<String, dynamic> json) =>
    DepositElement(
      depositedAmount: json['Deposited Amount'] as String?,
      transactionId: json['Transaction Id'],
      status: json['Status'] as String?,
      date:
          json['Date'] == null ? null : DateTime.parse(json['Date'] as String),
    );

Map<String, dynamic> _$DepositElementToJson(DepositElement instance) =>
    <String, dynamic>{
      'Deposited Amount': instance.depositedAmount,
      'Transaction Id': instance.transactionId,
      'Status': instance.status,
      'Date': instance.date?.toIso8601String(),
    };
