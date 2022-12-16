import 'dart:convert';

class UserModel {
  String username;
  String birthDate;
  String profilePhoto;
  String email;
  String phone;
  List<String> listings;
  List<String> blocked;

  // Firebase Releated
  String uid;
  int createdAt;
  int updatedAt;

  UserModel({
    required this.username,
    required this.birthDate,
    required this.profilePhoto,
    required this.email,
    required this.phone,
    required this.listings,
    required this.uid,
    required this.createdAt,
    required this.updatedAt,
    required this.blocked,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'birthDate': birthDate,
      'profilePhoto': profilePhoto,
      'email': email,
      'phone': phone,
      'listings': listings,
      'uid': uid,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        username: map['username'] as String,
        birthDate: map['birthDate'] as String,
        profilePhoto: map['profilePhoto'] as String,
        email: map['email'] as String,
        phone: map['phone'] as String,
        listings: List<String>.from(map['listings'] as List<String>),
        uid: map['uid'] as String,
        createdAt: map['createdAt'] as int,
        updatedAt: map['updatedAt'] as int,
        blocked: List<String>.from(map['blocked'] as List<String>));
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
