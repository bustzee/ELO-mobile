// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
      'message': instance.message,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
      tokenType: json['token_type'] as String?,
      bankDetails: json['bank_details'] == null
          ? null
          : BankDetails.fromJson(json['bank_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'user': instance.user,
      'token': instance.token,
      'token_type': instance.tokenType,
      'bank_details': instance.bankDetails,
    };

BankDetails _$BankDetailsFromJson(Map<String, dynamic> json) => BankDetails(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      bankName: json['bank_name'] as String?,
      accountNumber: json['account_number'] as String?,
      branchName: json['branch_name'] as String?,
      ifscCode: json['ifsc_code'] as String?,
      micrCode: json['micr_code'] as String?,
      swiftCode: json['swift_code'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      routingNumber: json['routing_number'] as String?,
    );

Map<String, dynamic> _$BankDetailsToJson(BankDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'bank_name': instance.bankName,
      'account_number': instance.accountNumber,
      'branch_name': instance.branchName,
      'ifsc_code': instance.ifscCode,
      'micr_code': instance.micrCode,
      'swift_code': instance.swiftCode,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'routing_number': instance.routingNumber,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      password: json['password'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      username: json['username'] as String?,
      phone: json['phone'] as String?,
      businessInfo: json['business_info'],
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
      agree: json['agree'],
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
