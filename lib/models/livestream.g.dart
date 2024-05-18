// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'livestream.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Livestream _$LivestreamFromJson(Map<String, dynamic> json) => Livestream(
      status: json['status'] as String?,
      livestreams: (json['livestreams'] as List<dynamic>?)
          ?.map((e) => LivestreamElement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LivestreamToJson(Livestream instance) =>
    <String, dynamic>{
      'status': instance.status,
      'livestreams': instance.livestreams,
    };

LivestreamElement _$LivestreamElementFromJson(Map<String, dynamic> json) =>
    LivestreamElement(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      streamId: json['stream_id'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      name: json['name'] as String?,
      image: json['image'] as String?,
      description: json['description'] as String?,
      delayTime: json['delay_time'] as String?,
      viewCounter: (json['view_counter'] as num?)?.toInt(),
      type: json['type'],
      fileLink: json['fileLink'] as bool?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LivestreamElementToJson(LivestreamElement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'stream_id': instance.streamId,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'name': instance.name,
      'image': instance.image,
      'description': instance.description,
      'delay_time': instance.delayTime,
      'view_counter': instance.viewCounter,
      'type': instance.type,
      'fileLink': instance.fileLink,
      'user': instance.user,
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
      dateOfBirth: json['date_of_birth'],
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
      'date_of_birth': instance.dateOfBirth,
      'user_age': instance.userAge,
      'agree': instance.agree,
      'imageLink': instance.imageLink,
      'name': instance.name,
    };
