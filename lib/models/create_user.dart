import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_user.g.dart';

@JsonSerializable()
class CreateUser extends Equatable {
    CreateUser({
        required this.firstname,
        required this.lastname,
        required this.email,
        required this.username,
        required this.phone,
        required this.businessInfo,
        required this.address,
        required this.password,
        required this.dateOfBirth,
        required this.agree,
        required this.profile,
    });

    final String? firstname;
    static const String firstnameKey = "firstname";
    
    final String? lastname;
    static const String lastnameKey = "lastname";
    
    final String? email;
    static const String emailKey = "email";
    
    final String? username;
    static const String usernameKey = "username";
    
    final String? phone;
    static const String phoneKey = "phone";
    

    @JsonKey(name: 'business_info') 
    final String? businessInfo;
    static const String businessInfoKey = "business_info";
    
    final String? address;
    static const String addressKey = "address";
    
    final String? password;
    static const String passwordKey = "password";
    

    @JsonKey(name: 'date_of_birth') 
    final DateTime? dateOfBirth;
    static const String dateOfBirthKey = "date_of_birth";
    
    final String? agree;
    static const String agreeKey = "agree";
    
    final String? profile;
    static const String profileKey = "profile";
    

    CreateUser copyWith({
        String? firstname,
        String? lastname,
        String? email,
        String? username,
        String? phone,
        String? businessInfo,
        String? address,
        String? password,
        DateTime? dateOfBirth,
        String? agree,
        String? profile,
    }) {
        return CreateUser(
            firstname: firstname ?? this.firstname,
            lastname: lastname ?? this.lastname,
            email: email ?? this.email,
            username: username ?? this.username,
            phone: phone ?? this.phone,
            businessInfo: businessInfo ?? this.businessInfo,
            address: address ?? this.address,
            password: password ?? this.password,
            dateOfBirth: dateOfBirth ?? this.dateOfBirth,
            agree: agree ?? this.agree,
            profile: profile ?? this.profile,
        );
    }

    factory CreateUser.fromJson(Map<String, dynamic> json) => _$CreateUserFromJson(json);

    Map<String, dynamic> toJson() => _$CreateUserToJson(this);

    @override
    String toString(){
        return "$firstname, $lastname, $email, $username, $phone, $businessInfo, $address, $password, $dateOfBirth, $agree, $profile, ";
    }

    @override
    List<Object?> get props => [
    firstname, lastname, email, username, phone, businessInfo, address, password, dateOfBirth, agree, profile, ];
}
