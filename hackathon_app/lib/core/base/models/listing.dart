import 'dart:convert';

import 'package:hackathon_app/core/constants/enums/categories.dart';

class ListingModel {
  List photos;
  double price;
  String title;
  String description;
  String country;
  String state;
  String coordinates;
  List comments;
  List likes;
  CategoriesType category;

  // Firebase Releated
  String uid;
  String userUID;
  int createdAt;
  int updatedAt;

  ListingModel({
    required this.photos,
    required this.price,
    required this.title,
    required this.description,
    required this.country,
    required this.state,
    required this.coordinates,
    required this.comments,
    required this.likes,
    required this.category,
    required this.uid,
    required this.userUID,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'photos': photos,
      'price': price,
      'title': title,
      'description': description,
      'country': country,
      'state': state,
      'coordinates': coordinates,
      'comments': comments,
      'likes': likes,
      'category': category.index,
      'uid': uid,
      'userUID': userUID,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory ListingModel.fromMap(Map<String, dynamic> map) {
    return ListingModel(
      photos: map['photos'] as List? ?? [],
      price: map['price'] as double,
      title: map['title'] as String,
      description: map['description'] as String,
      country: map['country'] as String,
      state: map['state'] as String,
      coordinates: map['coordinates'] as String,
      comments: map['comments'] as List? ?? [],
      likes: map['likes'] as List? ?? [],
      category: CategoriesType.values[map['category'] as int],
      uid: map['uid'] as String,
      userUID: map['userUID'] as String,
      createdAt: map['createdAt'] as int,
      updatedAt: map['updatedAt'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ListingModel.fromJson(String source) =>
      ListingModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
