// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_userdetails.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminUserdetails _$AdminUserdetailsFromJson(Map<String, dynamic> json) =>
    AdminUserdetails(
      status: json['status'] as String?,
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdminUserdetailsToJson(AdminUserdetails instance) =>
    <String, dynamic>{
      'status': instance.status,
      'users': instance.users,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      password: json['password'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      username: json['username'] as String?,
      phone: json['phone'] as String?,
      businessInfo: json['business_info'] as String?,
      profile: json['profile'] as String?,
      address: json['address'] as String?,
      rememberToken: json['remember_token'],
      eloBalance: (json['elo_balance'] as num?)?.toInt(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      userType: json['user_type'],
      status: (json['status'] as num?)?.toInt(),
      paypalEmail: json['paypal_email'],
      streamKey: json['stream_key'] as String?,
      dateOfBirth: json['date_of_birth'] == null
          ? null
          : DateTime.parse(json['date_of_birth'] as String),
      userAge: json['user_age'] as String?,
      agree: json['agree'] as String?,
      imageLink: json['imageLink'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'phone': instance.phone,
      'business_info': instance.businessInfo,
      'profile': instance.profile,
      'address': instance.address,
      'remember_token': instance.rememberToken,
      'elo_balance': instance.eloBalance,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'user_type': instance.userType,
      'status': instance.status,
      'paypal_email': instance.paypalEmail,
      'stream_key': instance.streamKey,
      'date_of_birth': instance.dateOfBirth?.toIso8601String(),
      'user_age': instance.userAge,
      'agree': instance.agree,
      'imageLink': instance.imageLink,
      'name': instance.name,
    };
