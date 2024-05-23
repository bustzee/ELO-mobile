import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'leaderboard.g.dart';

@JsonSerializable()
class Leaderboard extends Equatable {
    Leaderboard({
        required this.status,
        required this.data,
    });

    final String? status;
    static const String statusKey = "status";
    
    final List<Datum>? data;
    static const String dataKey = "data";
    

    Leaderboard copyWith({
        String? status,
        List<Datum>? data,
    }) {
        return Leaderboard(
            status: status ?? this.status,
            data: data ?? this.data,
        );
    }

    factory Leaderboard.fromJson(Map<String, dynamic> json) => _$LeaderboardFromJson(json);

    Map<String, dynamic> toJson() => _$LeaderboardToJson(this);

    @override
    String toString(){
        return "$status, $data, ";
    }

    @override
    List<Object?> get props => [
    status, data, ];
}

@JsonSerializable()
class Datum extends Equatable {
    Datum({
        required this.id,
        required this.userId,
        required this.streamId,
        required this.status,
        required this.createdAt,
        required this.updatedAt,
        required this.name,
        required this.image,
        required this.description,
        required this.delayTime,
        required this.viewCounter,
        required this.type,
        required this.likeCount,
        required this.potAmount,
        required this.fileLink,
        required this.user,
    });

    final int? id;
    static const String idKey = "id";
    

    @JsonKey(name: 'user_id') 
    final int? userId;
    static const String userIdKey = "user_id";
    

    @JsonKey(name: 'stream_id') 
    final String? streamId;
    static const String streamIdKey = "stream_id";
    
    final String? status;
    static const String statusKey = "status";
    

    @JsonKey(name: 'created_at') 
    final DateTime? createdAt;
    static const String createdAtKey = "created_at";
    

    @JsonKey(name: 'updated_at') 
    final DateTime? updatedAt;
    static const String updatedAtKey = "updated_at";
    
    final String? name;
    static const String nameKey = "name";
    
    final String? image;
    static const String imageKey = "image";
    
    final String? description;
    static const String descriptionKey = "description";
    

    @JsonKey(name: 'delay_time') 
    final String? delayTime;
    static const String delayTimeKey = "delay_time";
    

    @JsonKey(name: 'view_counter') 
    final dynamic viewCounter;
    static const String viewCounterKey = "view_counter";
    
    final dynamic type;
    static const String typeKey = "type";
    

    @JsonKey(name: 'like_count') 
    final int? likeCount;
    static const String likeCountKey = "like_count";
    

    @JsonKey(name: 'pot_amount') 
    final String? potAmount;
    static const String potAmountKey = "pot_amount";
    
    final bool? fileLink;
    static const String fileLinkKey = "fileLink";
    
    final User? user;
    static const String userKey = "user";
    

    Datum copyWith({
        int? id,
        int? userId,
        String? streamId,
        String? status,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? name,
        String? image,
        String? description,
        String? delayTime,
        dynamic? viewCounter,
        dynamic? type,
        int? likeCount,
        String? potAmount,
        bool? fileLink,
        User? user,
    }) {
        return Datum(
            id: id ?? this.id,
            userId: userId ?? this.userId,
            streamId: streamId ?? this.streamId,
            status: status ?? this.status,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            name: name ?? this.name,
            image: image ?? this.image,
            description: description ?? this.description,
            delayTime: delayTime ?? this.delayTime,
            viewCounter: viewCounter ?? this.viewCounter,
            type: type ?? this.type,
            likeCount: likeCount ?? this.likeCount,
            potAmount: potAmount ?? this.potAmount,
            fileLink: fileLink ?? this.fileLink,
            user: user ?? this.user,
        );
    }

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

    Map<String, dynamic> toJson() => _$DatumToJson(this);

    @override
    String toString(){
        return "$id, $userId, $streamId, $status, $createdAt, $updatedAt, $name, $image, $description, $delayTime, $viewCounter, $type, $likeCount, $potAmount, $fileLink, $user, ";
    }

    @override
    List<Object?> get props => [
    id, userId, streamId, status, createdAt, updatedAt, name, image, description, delayTime, viewCounter, type, likeCount, potAmount, fileLink, user, ];
}

@JsonSerializable()
class User extends Equatable {
    User({
        required this.id,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.username,
        required this.phone,
        required this.businessInfo,
        required this.profile,
        required this.address,
        required this.rememberToken,
        required this.eloBalance,
        required this.createdAt,
        required this.updatedAt,
        required this.userType,
        required this.status,
        required this.paypalEmail,
        required this.streamKey,
        required this.dateOfBirth,
        required this.userAge,
        required this.agree,
        required this.imageLink,
        required this.name,
    });

    final int? id;
    static const String idKey = "id";
    
    final String? email;
    static const String emailKey = "email";
    
    final String? firstName;
    static const String firstNameKey = "firstName";
    
    final String? lastName;
    static const String lastNameKey = "lastName";
    
    final String? username;
    static const String usernameKey = "username";
    
    final String? phone;
    static const String phoneKey = "phone";
    

    @JsonKey(name: 'business_info') 
    final dynamic businessInfo;
    static const String businessInfoKey = "business_info";
    
    final String? profile;
    static const String profileKey = "profile";
    
    final String? address;
    static const String addressKey = "address";
    

    @JsonKey(name: 'remember_token') 
    final dynamic rememberToken;
    static const String rememberTokenKey = "remember_token";
    

    @JsonKey(name: 'elo_balance') 
    final int? eloBalance;
    static const String eloBalanceKey = "elo_balance";
    

    @JsonKey(name: 'created_at') 
    final DateTime? createdAt;
    static const String createdAtKey = "created_at";
    

    @JsonKey(name: 'updated_at') 
    final DateTime? updatedAt;
    static const String updatedAtKey = "updated_at";
    

    @JsonKey(name: 'user_type') 
    final dynamic userType;
    static const String userTypeKey = "user_type";
    
    final int? status;
    static const String statusKey = "status";
    

    @JsonKey(name: 'paypal_email') 
    final dynamic paypalEmail;
    static const String paypalEmailKey = "paypal_email";
    

    @JsonKey(name: 'stream_key') 
    final String? streamKey;
    static const String streamKeyKey = "stream_key";
    

    @JsonKey(name: 'date_of_birth') 
    final DateTime? dateOfBirth;
    static const String dateOfBirthKey = "date_of_birth";
    

    @JsonKey(name: 'user_age') 
    final String? userAge;
    static const String userAgeKey = "user_age";
    
    final dynamic agree;
    static const String agreeKey = "agree";
    
    final String? imageLink;
    static const String imageLinkKey = "imageLink";
    
    final String? name;
    static const String nameKey = "name";
    

    User copyWith({
        int? id,
        String? email,
        String? firstName,
        String? lastName,
        String? username,
        String? phone,
        dynamic? businessInfo,
        String? profile,
        String? address,
        dynamic? rememberToken,
        int? eloBalance,
        DateTime? createdAt,
        DateTime? updatedAt,
        dynamic? userType,
        int? status,
        dynamic? paypalEmail,
        String? streamKey,
        DateTime? dateOfBirth,
        String? userAge,
        dynamic? agree,
        String? imageLink,
        String? name,
    }) {
        return User(
            id: id ?? this.id,
            email: email ?? this.email,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            username: username ?? this.username,
            phone: phone ?? this.phone,
            businessInfo: businessInfo ?? this.businessInfo,
            profile: profile ?? this.profile,
            address: address ?? this.address,
            rememberToken: rememberToken ?? this.rememberToken,
            eloBalance: eloBalance ?? this.eloBalance,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            userType: userType ?? this.userType,
            status: status ?? this.status,
            paypalEmail: paypalEmail ?? this.paypalEmail,
            streamKey: streamKey ?? this.streamKey,
            dateOfBirth: dateOfBirth ?? this.dateOfBirth,
            userAge: userAge ?? this.userAge,
            agree: agree ?? this.agree,
            imageLink: imageLink ?? this.imageLink,
            name: name ?? this.name,
        );
    }

    factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

    Map<String, dynamic> toJson() => _$UserToJson(this);

    @override
    String toString(){
        return "$id, $email, $firstName, $lastName, $username, $phone, $businessInfo, $profile, $address, $rememberToken, $eloBalance, $createdAt, $updatedAt, $userType, $status, $paypalEmail, $streamKey, $dateOfBirth, $userAge, $agree, $imageLink, $name, ";
    }

    @override
    List<Object?> get props => [
    id, email, firstName, lastName, username, phone, businessInfo, profile, address, rememberToken, eloBalance, createdAt, updatedAt, userType, status, paypalEmail, streamKey, dateOfBirth, userAge, agree, imageLink, name, ];
}
