// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUser _$CreateUserFromJson(Map<String, dynamic> json) => CreateUser(
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      phone: json['phone'] as String?,
      businessInfo: json['business_info'] as String?,
      address: json['address'] as String?,
      password: json['password'] as String?,
      dateOfBirth: json['date_of_birth'] == null
          ? null
          : DateTime.parse(json['date_of_birth'] as String),
      agree: json['agree'] as String?,
      profile: json['profile'] as String?,
    );

Map<String, dynamic> _$CreateUserToJson(CreateUser instance) =>
    <String, dynamic>{
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'username': instance.username,
      'phone': instance.phone,
      'business_info': instance.businessInfo,
      'address': instance.address,
      'password': instance.password,
      'date_of_birth': instance.dateOfBirth?.toIso8601String(),
      'agree': instance.agree,
      'profile': instance.profile,
    };
