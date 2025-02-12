import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locazen/models/app_constants.dart';
import 'package:locazen/models/user_model.dart';
import 'package:locazen/views/guestScreen/account_screen.dart';
import 'package:locazen/views/guest_home_screen.dart';

class UserViewModel {
  UserModel userModel = UserModel();

  //signUp process
  signUp(email, password, firstName, lastName, city, country, bio,
      imageFileOfUser) async {
    Get.snackbar("Veuillez Patienté", " votre compt a ete creer");
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((result) async {
        String currentUserID = result.user!.uid;
        AppConstants.currentUser.id = currentUserID;
        AppConstants.currentUser.firstName = firstName;
        AppConstants.currentUser.lastName = lastName;
        AppConstants.currentUser.city = city;
        AppConstants.currentUser.country = country;
        AppConstants.currentUser.bio = bio;
        AppConstants.currentUser.password = password;
        await saveUserToFirestore(
                firstName, lastName, bio, city, country, email, currentUserID)
            .whenComplete(() async {
          await addImageToFirebaseStorage(imageFileOfUser, currentUserID);
        });
        Get.to(GuestHomeScreen());
        Get.snackbar("Felicitation", " votre compt a ete creer");
      });
    } catch (e) {
      Get.snackbar("Erreur", e.toString());
    }
  }

  Future<void> saveUserToFirestore(
      firstName, lastName, bio, city, country, email, id) async {
    Map<String, dynamic> dataMap = {
      "firstName": firstName,
      "lastName": lastName,
      "bio": bio,
      "city": city,
      "country": country,
      "email": email,
      "isHost": false,
      "myPostingIDs": [],
      "savePostingIDs": [],
      "earning": 0
    };
    await FirebaseFirestore.instance.collection("users").doc(id).set(dataMap);
  }

  addImageToFirebaseStorage(File imageFileOfUser, currentUserID) async {
    Reference referenceStorage = FirebaseStorage.instance
        .ref()
        .child("userImages")
        .child(currentUserID)
        .child(currentUserID + ".png");
    await referenceStorage.putFile(imageFileOfUser).whenComplete(() {});
    AppConstants.currentUser.displayImage =
        MemoryImage(imageFileOfUser.readAsBytesSync());
  }

  //login logic
  login(email, password) async {
    Get.snackbar("Connexion", "...");
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((result) async {
        String currentUserID = result.user!.uid;
        AppConstants.currentUser.id = currentUserID;
        await getUserInfoFromFirestore(currentUserID);
        await getImageFromStorage(currentUserID);
        Get.snackbar("Connectée", "...");
        Get.to(GuestHomeScreen());
      });
    } catch (e) {
      Get.snackbar("Erreur", e.toString());
    }
  }

  getUserInfoFromFirestore(userID) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('users').doc(userID).get();
    AppConstants.currentUser.snapshot = snapshot;
    AppConstants.currentUser.firstName = snapshot["firstName"] ?? "";
    AppConstants.currentUser.lastName = snapshot["lastName"] ?? "";
    AppConstants.currentUser.email = snapshot["email"] ?? "";
    AppConstants.currentUser.bio = snapshot["bio"] ?? "";
    AppConstants.currentUser.city = snapshot["city"] ?? "";
    AppConstants.currentUser.country = snapshot["country"] ?? "";
    AppConstants.currentUser.isHost = snapshot["isHost"] ?? false;
  }

  getImageFromStorage(userID) async {
    if (AppConstants.currentUser.displayImage != null) {
      return AppConstants.currentUser.displayImage;
    }
    final imageDataInInBytes = await FirebaseStorage.instance
        .ref()
        .child("userImages")
        .child(userID)
        .child(userID + 'png')
        .getData(1024 * 1024);

    AppConstants.currentUser.displayImage = MemoryImage(imageDataInInBytes!);
    return AppConstants.currentUser.displayImage;
  }

  becomeHost(String userID) async {
    userModel.isHost = true;
    Map<String, dynamic> dataMap = {
      "isHost": true,
    };
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userID)
        .update(dataMap);
  }

  modifyCurrentHostinge(bool isHosting) {
    userModel.iscurrentlyHosting = isHosting;
  }
}
