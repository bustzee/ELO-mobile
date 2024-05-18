import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_details.g.dart';

@JsonSerializable()
class UserDetails extends Equatable {
    UserDetails({
        required this.status,
        required this.data,
        required this.message,
    });

    final String? status;
    static const String statusKey = "status";
    
    final Data? data;
    static const String dataKey = "data";
    
    final String? message;
    static const String messageKey = "message";
    

    UserDetails copyWith({
        String? status,
        Data? data,
        String? message,
    }) {
        return UserDetails(
            status: status ?? this.status,
            data: data ?? this.data,
            message: message ?? this.message,
        );
    }

    factory UserDetails.fromJson(Map<String, dynamic> json) => _$UserDetailsFromJson(json);

    Map<String, dynamic> toJson() => _$UserDetailsToJson(this);

    @override
    String toString(){
        return "$status, $data, $message, ";
    }

    @override
    List<Object?> get props => [
    status, data, message, ];
}

@JsonSerializable()
class Data extends Equatable {
    Data({
        required this.user,
        required this.token,
        required this.tokenType,
    });

    final User? user;
    static const String userKey = "user";
    
    final String? token;
    static const String tokenKey = "token";
    

    @JsonKey(name: 'token_type') 
    final String? tokenType;
    static const String tokenTypeKey = "token_type";
    

    Data copyWith({
        User? user,
        String? token,
        String? tokenType,
    }) {
        return Data(
            user: user ?? this.user,
            token: token ?? this.token,
            tokenType: tokenType ?? this.tokenType,
        );
    }

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

    Map<String, dynamic> toJson() => _$DataToJson(this);

    @override
    String toString(){
        return "$user, $token, $tokenType, ";
    }

    @override
    List<Object?> get props => [
    user, token, tokenType, ];
}

@JsonSerializable()
class User extends Equatable {
    User({
        required this.id,
        required this.email,
        required this.password,
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
    
    final String? password;
    static const String passwordKey = "password";
    
    final String? firstName;
    static const String firstNameKey = "firstName";
    
    final String? lastName;
    static const String lastNameKey = "lastName";
    
    final String? username;
    static const String usernameKey = "username";
    
    final String? phone;
    static const String phoneKey = "phone";
    

    @JsonKey(name: 'business_info') 
    final String? businessInfo;
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
    
    final String? agree;
    static const String agreeKey = "agree";
    
    final String? imageLink;
    static const String imageLinkKey = "imageLink";
    
    final String? name;
    static const String nameKey = "name";
    

    User copyWith({
        int? id,
        String? email,
        String? password,
        String? firstName,
        String? lastName,
        String? username,
        String? phone,
        String? businessInfo,
        String? profile,
        String? address,
        dynamic rememberToken,
        int? eloBalance,
        DateTime? createdAt,
        DateTime? updatedAt,
        dynamic userType,
        int? status,
        dynamic paypalEmail,
        String? streamKey,
        DateTime? dateOfBirth,
        String? userAge,
        String? agree,
        String? imageLink,
        String? name,
    }) {
        return User(
            id: id ?? this.id,
            email: email ?? this.email,
            password: password ?? this.password,
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
        return "$id, $email, $password, $firstName, $lastName, $username, $phone, $businessInfo, $profile, $address, $rememberToken, $eloBalance, $createdAt, $updatedAt, $userType, $status, $paypalEmail, $streamKey, $dateOfBirth, $userAge, $agree, $imageLink, $name, ";
    }

    @override
    List<Object?> get props => [
    id, email, password, firstName, lastName, username, phone, businessInfo, profile, address, rememberToken, eloBalance, createdAt, updatedAt, userType, status, paypalEmail, streamKey, dateOfBirth, userAge, agree, imageLink, name, ];
}
