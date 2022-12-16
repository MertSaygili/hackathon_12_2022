import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackathon_app/core/base/services/db/ref.dart';

import '../../models/listing.dart';

class ListingsService {
  static final CollectionReference _ref = RefService.listings;

  static Future<void> createOne(ListingModel item) async {
    item.createdAt = DateTime.now().millisecondsSinceEpoch;
    item.updatedAt = item.createdAt;

    await _ref.doc(item.uid).set(item.toMap());
  }

  static Future<void> updateOne(ListingModel item) async {
    item.updatedAt = DateTime.now().millisecondsSinceEpoch;

    await _ref.doc(item.uid).update(item.toMap());
  }

  static Stream<QuerySnapshot> getAllAsStream(int lastUpdatedAtTime) {
    return _ref
        .where("updatedAt", isGreaterThan: lastUpdatedAtTime)
        .snapshots();
  }
}
