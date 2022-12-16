import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class CommentModel {
  String listingUID;
  String userUID;
  String content;

  // Firebase Releated
  String uid;
  int createdAt;
  int updatedAt;

  CommentModel({
    required this.listingUID,
    required this.userUID,
    required this.content,
    required this.uid,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'listingUID': listingUID,
      'userUID': userUID,
      'content': content,
      'uid': uid,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      listingUID: map['listingUID'] as String,
      userUID: map['userUID'] as String,
      content: map['content'] as String,
      uid: map['uid'] as String,
      createdAt: map['createdAt'] as int,
      updatedAt: map['updatedAt'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
