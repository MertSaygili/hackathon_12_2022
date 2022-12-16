import 'dart:convert';

class ListingModel {
  List<String> photos;
  double price;
  String description;
  List<String> comments;

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
      photos: List<String>.from(map['photos'] as List<String>),
      price: map['price'] as double,
      description: map['description'] as String,
      comments: List<String>.from(map['comments'] as List<String>),
      uid: map['uid'] as String,
      createdAt: map['createdAt'] as int,
      updatedAt: map['updatedAt'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListingModel.fromJson(String source) =>
      ListingModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
