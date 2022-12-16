import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hackathon_app/core/base/services/db/ref.dart';

import '../../models/comment.dart';

class CommentsService {
  static final CollectionReference _ref = RefService.comments;

  static Future<void> createOne(CommentModel item) async {
    item.createdAt = DateTime.now().millisecondsSinceEpoch;
    item.updatedAt = item.createdAt;

    await _ref.doc(item.uid).set(item.toMap());
  }

  static Future<void> updateOne(CommentModel item) async {
    item.updatedAt = DateTime.now().millisecondsSinceEpoch;

    await _ref.doc(item.uid).update(item.toMap());
  }

  static Stream<QuerySnapshot> getAllAsStream(int lastUpdatedAtTime) {
    return _ref
        .where("updatedAt", isGreaterThan: lastUpdatedAtTime)
        .snapshots();
  }
}
