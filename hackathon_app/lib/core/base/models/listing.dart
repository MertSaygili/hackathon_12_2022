import 'dart:convert';

class ListingModel {
  List photos;
  double price;
  String description;
  List comments;

  // Firebase Releated
  String uid;
  int createdAt;
  int updatedAt;

  ListingModel({
    required this.photos,
    required this.price,
    required this.description,
    required this.comments,
    required this.uid,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'photos': photos,
      'price': price,
      'description': description,
      'comments': comments,
      'uid': uid,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory ListingModel.fromMap(Map<String, dynamic> map) {
    return ListingModel(
      photos: map['photos'] as List? ?? [],
      price: map['price'] as double,
      description: map['description'] as String,
      comments: map['comments'] as List? ?? [],
      uid: map['uid'] as String,
      createdAt: map['createdAt'] as int,
      updatedAt: map['updatedAt'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListingModel.fromJson(String source) =>
      ListingModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
