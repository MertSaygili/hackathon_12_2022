import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  static final FirebaseStorage _storage = FirebaseStorage.instance;

  static Reference get listingPhotosRef => _storage.ref('/listingPhotos');
  static Reference get profilePhotoRef => _storage.ref('/profilePhotos');
  static Reference get avatarPhotoRef => _storage.ref('/avatars');

  static Future<String> uploadImageToStorage(
      String id, File? image, Reference ref) async {
    UploadTask uploadTask = ref.child(id).putFile(image!);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  static Future<void> deleteFileFromStorage(String uid, Reference ref) async =>
      await ref.child(uid).delete();

  static Future<String> getImageFromStorage(String id, Reference ref) async =>
      await ref.child(id).getDownloadURL();
}
