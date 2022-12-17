import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackathon_app/core/base/models/bid.dart';
import 'package:hackathon_app/core/base/services/db/ref.dart';

class BidsService {
  static final CollectionReference _ref = RefService.bids;

  static Future<void> createOne(BidModel item) async {
    item.createdAt = DateTime.now().millisecondsSinceEpoch;
    item.updatedAt = item.createdAt;

    await _ref.doc(item.uid).set(item.toMap());
  }

  static Future<void> updateOne(BidModel item) async {
    item.updatedAt = DateTime.now().millisecondsSinceEpoch;

    await _ref.doc(item.uid).update(item.toMap());
  }

  static Stream<QuerySnapshot> getAllAsStream(int lastUpdatedAtTime) {
    return _ref
        .where("updatedAt", isGreaterThan: lastUpdatedAtTime)
        .snapshots();
  }
}
