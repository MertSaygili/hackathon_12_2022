import 'dart:convert';

import 'package:hackathon_app/core/constants/enums/gender.dart';

class UserModel {
  String username;
  String about;
  GenderType gender;
  String birthDate;
  String profilePhoto;
  String email;
  String phone;
  List listings;
  List blocked;

  // Firebase Releated
  String uid;
  int createdAt;
  int updatedAt;

  UserModel({
    required this.username,
    required this.about,
    required this.gender,
    required this.birthDate,
    required this.profilePhoto,
    required this.email,
    required this.phone,
    required this.listings,
    required this.blocked,
    required this.uid,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'about': about,
      'gender': gender.index,
      'birthDate': birthDate,
      'profilePhoto': profilePhoto,
      'email': email,
      'phone': phone,
      'listings': listings,
      'blocked': blocked,
      'uid': uid,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] as String,
      about: map['about'] as String,
      gender: GenderType.values[map['gender'] as int],
      birthDate: map['birthDate'] as String,
      profilePhoto: map['profilePhoto'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      listings: map['listings'] as List? ?? [],
      blocked: map['blocked'] as List? ?? [],
      uid: map['uid'] as String,
      createdAt: map['createdAt'] as int,
      updatedAt: map['updatedAt'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
