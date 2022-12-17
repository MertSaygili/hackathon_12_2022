import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hackathon_app/core/constants/app/colors.dart';
import 'package:hackathon_app/core/constants/enums/gender.dart';

import 'package:hive/hive.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../../../view/home/home_page_controller.dart';
import '../../../view/preview/onboard.dart';
import '../../constants/enums/categories.dart';
import '../../init/utils/prefs_helper.dart';
import '../models/comment.dart';
import '../models/listing.dart';
import '../models/user.dart';
import '../services/db/comments.dart';
import '../services/db/listings.dart';
import '../services/db/users.dart';
import '../services/storage/storage_service.dart';

class AppController extends GetxController {
  bool isLoginPressed = false;

  List<ListingModel> listingList = [];
  List<ListingModel> listingListNonBlocked = [];
  List<UserModel> userList = [];
  List<CommentModel> commentList = [];

  List<File?> images = [];

  late Rx<User?> _user;

  UserModel? currentUser;
  String currentUserSignInMethod = "";

  late Box _usersBox;
  late Box _listingsBox;
  late Box _commentsBox;

  String email = '';
  String password = '';
  String username = '';

  File? profilePhoto;

  var firebaseAuth = FirebaseAuth.instance;

  static const String listingId = "listingId";
  static const String authId = "authId";

  StreamSubscription<QuerySnapshot<Object?>>? listingsListener;
  StreamSubscription<QuerySnapshot<Object?>>? usersListener;
  StreamSubscription<QuerySnapshot<Object?>>? commentsListener;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
    ever(_user, _controlListeners);
  }

  _controlListeners(User? user) async {
    try {
      if (user != null) {
        await _subscribeListings();
        await _subscribeUsers();
        await _subscribeComments();
      } else {
        if (listingsListener != null) listingsListener!.cancel();
        if (usersListener != null) usersListener!.cancel();
        if (commentsListener != null) commentsListener!.cancel();
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  _setInitialScreen(User? user) async {
    if (user == null) {
      Get.offAll(() => const OnboardPreview());
    } else {
      if (userList.isNotEmpty) {
        for (var element in userList) {
          if (element.uid == firebaseAuth.currentUser!.uid) {
            currentUser = element;
          }
        }
      }

      Get.offAll(() => const HomePageControllerView());
    }
  }

  Future<void> _subscribeListings() async {
    _listingsBox = await Hive.openBox(PrefsHelper.listingsBox);

    _updateListings();

    final lastUpdatedAtTime =
        listingList.fold(0, (int p, e) => p < e.updatedAt ? e.updatedAt : p);

    //update([videoId]);

    listingsListener = ListingsService.getAllAsStream(
      lastUpdatedAtTime,
    ).listen((event) async {
      await _listingsBox
          .putAll(event.docs.fold({}, (p, e) => p..[e.id] = e.data()));
      _updateListings();
      //update([videoId]);
    });
  }

  void _updateListings() {
    listingList = _listingsBox
        .toMap()
        .entries
        .map((e) => ListingModel.fromMap(Map<String, dynamic>.from(e.value)))
        .toList();

    if (listingList.isNotEmpty) {
      if (listingListNonBlocked.isNotEmpty) {
        listingListNonBlocked.clear();
      }
      for (ListingModel listingModel in listingList) {
        if (currentUser!.blocked.contains(listingModel.uid)) {
          continue;
        }
        listingListNonBlocked.add(listingModel);
      }
    }
  }

  Future<void> _subscribeUsers() async {
    _usersBox = await Hive.openBox(PrefsHelper.usersBox);

    _updateUsers();

    final lastUpdatedAtTime =
        userList.fold(0, (int p, e) => p < e.updatedAt ? e.updatedAt : p);

    // update([userId, authId, navigationId]);

    usersListener = UsersService.getAllAsStream(
      lastUpdatedAtTime,
    ).listen((event) async {
      await _usersBox
          .putAll(event.docs.fold({}, (p, e) => p..[e.id] = e.data()));
      _updateUsers();
      // update([userId, authId, navigationId]);
    });
  }

  void _updateUsers() {
    userList = _usersBox
        .toMap()
        .entries
        .map((e) => UserModel.fromMap(Map<String, dynamic>.from(e.value)))
        .toList();

    if (userList.isNotEmpty) {
      for (var element in userList) {
        if (element.uid == firebaseAuth.currentUser!.uid) {
          currentUser = element;
        }
      }
    }
  }

  Future<void> _subscribeComments() async {
    _commentsBox = await Hive.openBox(PrefsHelper.commentsBox);

    _updateComments();

    final lastUpdatedAtTime =
        commentList.fold(0, (int p, e) => p < e.updatedAt ? e.updatedAt : p);

    // update([userId, authId, navigationId]);

    commentsListener = CommentsService.getAllAsStream(
      lastUpdatedAtTime,
    ).listen((event) async {
      await _commentsBox
          .putAll(event.docs.fold({}, (p, e) => p..[e.id] = e.data()));
      _updateComments();
    });
  }

  void _updateComments() {
    commentList = _commentsBox
        .toMap()
        .entries
        .map((e) => CommentModel.fromMap(Map<String, dynamic>.from(e.value)))
        .toList();
  }

  void registerUser() async {
    String downloadUrl;
    try {
      await checkIfUserExists(email).then((value) async {
        if (!value) {
          await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password);
          downloadUrl = profilePhoto != null
              ? await StorageService.uploadImageToStorage(
                  firebaseAuth.currentUser!.uid,
                  profilePhoto,
                  StorageService.profilePhotoRef)
              : "";
          UserModel user = UserModel(
            username: username,
            gender: GenderType.unknown,
            profilePhoto: downloadUrl,
            email: email,
            uid: firebaseAuth.currentUser!.uid,
            phone: "",
            listings: [],
            createdAt: 0,
            updatedAt: 0,
            birthDate: "",
            blocked: [],
          );
          await UsersService.createOne(user);
          Get.snackbar("Register", "You are successfully registered");
          profilePhoto = null;
          currentUserSignInMethod = (await getUserSignInMethods(email)).first;
        } else {
          Get.snackbar("Register", "An account with this email already exists");
        }
      });
    } catch (e) {
      Get.snackbar("Error registering user!", e.toString());
    }
  }

  void loginUser() async {
    isLoginPressed = true;
    // update([authId]);
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      Get.snackbar(
          "Login", "You have successfully logged in navigating to home page!");
      currentUserSignInMethod = (await getUserSignInMethods(email)).first;
    } catch (e) {
      Get.snackbar("Login Issue", e.toString());
    } finally {
      isLoginPressed = false;
      // update([authId]);
    }
  }

  void signInGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;
      GoogleSignInAccount? gUser = googleUser;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await checkIfUserExists(googleUser.email).then((value) async {
        await firebaseAuth.signInWithCredential(credential);
        if (!value) {
          UserModel user = UserModel(
            username: gUser.displayName!,
            gender: GenderType.unknown,
            profilePhoto: gUser.photoUrl!,
            email: gUser.email,
            uid: firebaseAuth.currentUser!.uid,
            phone: "",
            listings: [],
            createdAt: 0,
            updatedAt: 0,
            birthDate: "",
            blocked: [],
          );
          await UsersService.createOne(user);
        }
      });

      Get.snackbar("Google Sign In",
          "You have successfully signed in via google navigating to home page!");
      currentUserSignInMethod = (await getUserSignInMethods(gUser.email)).first;
    } catch (e) {
      Get.snackbar("Google Sign In Error", e.toString());
    }
  }

  void signOut() async {
    if (GoogleSignIn().currentUser != null) {
      await GoogleSignIn().signOut();
    }
    await firebaseAuth.signOut();
    Get.offAll(() => const OnboardPreview());
  }

  void forgotPass() async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      Get.snackbar("Password Reset",
          "Password reset mail is sent successfully go check your mailbox!");
    } catch (e) {
      Get.snackbar("Forgot Pass Error", e.toString());
    }
  }

  Future<bool> checkIfUserExists(String email) async {
    List<String> signInMethods = await getUserSignInMethods(email);
    return signInMethods.isNotEmpty;
  }

  Future<List<String>> getUserSignInMethods(String email) async {
    return await firebaseAuth.fetchSignInMethodsForEmail(email);
  }

  Future<void> pickProfileImage(ImageSource imageSource) async {
    final pickedImage = await ImagePicker().pickImage(
        source: imageSource, preferredCameraDevice: CameraDevice.front);
    if (pickedImage != null) {
      var file = await ImageCropper().cropImage(
        maxHeight: 400,
        maxWidth: 400,
        sourcePath: pickedImage.path,
        aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 40,
        uiSettings: [
          AndroidUiSettings(
              toolbarColor: Theme.of(Get.context!).colorScheme.background,
              toolbarWidgetColor: Get.isDarkMode ? Colors.white : Colors.black,
              activeControlsWidgetColor: colorPrimary),
        ],
      );
      Get.back();
      if (file != null) {
        Get.snackbar(
            "Profile Picture", "Profile picture successfully selected!");
        profilePhoto = File(file.path);
        // update([authId, userId]);
      } else {
        Get.snackbar("Profile Picture", "Compressed image is null!");
      }
    } else {
      Get.snackbar("Profile Picture", "You selected nothing!");
    }
    update([authId]);
  }

  Future<void> pickImage(ImageSource imageSource) async {
    final pickedImage = await ImagePicker().pickImage(
        source: imageSource, preferredCameraDevice: CameraDevice.front);
    if (pickedImage != null) {
      var file = await ImageCropper().cropImage(
        sourcePath: pickedImage.path,
        compressQuality: 40,
        uiSettings: [
          AndroidUiSettings(
            toolbarColor: Theme.of(Get.context!).colorScheme.background,
            toolbarWidgetColor: Get.isDarkMode ? Colors.white : Colors.black,
            activeControlsWidgetColor: colorPrimary,
          ),
        ],
      );
      Get.back();
      if (file != null) {
        Get.snackbar("Picture", "Picture successfully selected!");
        images.add(File(file.path));
        update([listingId]);
      } else {
        Get.snackbar("Picture", "Compressed image is null!");
      }
    } else {
      Get.snackbar("Profile Picture", "You selected nothing!");
    }
    update([authId]);
  }

  void blockUser(String uid) async {
    if (currentUser!.blocked.contains(uid)) {
      currentUser!.blocked.remove(uid);
    } else {
      currentUser!.blocked.add(uid);
    }
    await UsersService.updateOne(currentUser!);
    // update([profileMoreId]);
  }

  Future<void> addListing(
      double price, String title, String country, String state) async {
    List photoURL = [];
    DateTime now = DateTime.now();
    String id =
        "Listing ${now.day}:${now.month}:${now.year}_${now.hour}:${now.minute}:${now.second}.${now.millisecond}";
    for (int i = 0; i <= images.length; i++) {
      try {
        photoURL.add(
          await uploadImages("${id}_image_$i", images[i]),
        );
      } catch (e) {
        Get.snackbar("Error", e.toString());
      }
    }
    await ListingsService.createOne(
      ListingModel(
        photos: photoURL,
        price: price,
        title: title,
        country: country,
        state: state,
        coordinates: "",
        comments: [],
        likes: [],
        category: CategoriesType.unknown,
        uid: id,
        createdAt: 0,
        updatedAt: 0,
      ),
    );
  }

  Future<String> uploadImages(String id, file) async {
    return await StorageService.uploadImageToStorage(
        id, file, StorageService.listingPhotosRef);
  }
}
