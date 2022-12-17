import 'package:cloud_firestore/cloud_firestore.dart';

class RefService {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static CollectionReference get users => _db.collection("users");
  static CollectionReference get listings => _db.collection("listings");
  static CollectionReference get comments => _db.collection("comments");
  static CollectionReference get bids => _db.collection("bids");
}
