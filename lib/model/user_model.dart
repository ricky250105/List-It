// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String username;
  final String email;
  final String profileImage;
  UserModel({
    required this.username,
    required this.email,
    required this.profileImage,
  });

  UserModel copyWith({
    String? username,
    String? email,
    String? profileImage,
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      profileImage: profileImage ?? this.profileImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'profileImage': profileImage,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] as String,
      email: map['email'] as String,
      profileImage: map['profileImage'] as String,
    );
  }


  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.username == username &&
      other.email == email &&
      other.profileImage == profileImage;
  }

  @override
  int get hashCode => username.hashCode ^ email.hashCode ^ profileImage.hashCode;

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserModel(username: $username, email: $email, profileImage: $profileImage)';
}
