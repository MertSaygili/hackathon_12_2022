import 'dart:convert';

class BidModel {
  String userUID;
  double amount;

  // Firebase Releated
  String uid;
  int createdAt;
  int updatedAt;

  BidModel({
    required this.userUID,
    required this.amount,
    required this.uid,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userUID': userUID,
      'amount': amount,
      'uid': uid,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory BidModel.fromMap(Map<String, dynamic> map) {
    return BidModel(
      userUID: map['userUID'] as String,
      amount: map['amount'] as double,
      uid: map['uid'] as String,
      createdAt: map['createdAt'] as int,
      updatedAt: map['updatedAt'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory BidModel.fromJson(String source) =>
      BidModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
