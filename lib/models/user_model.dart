import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:locazen/models/contact_model.dart';

class UserModel extends ContactModel {
  String? email;
  String? password;
  String? bio;
  String? city;
  String? country;
  bool? isHost;
  bool? iscurrentlyHosting;
  DocumentSnapshot? snapshot;

  UserModel({
    String id = "",
    String lastName = "",
    String firstName = "",
    MemoryImage? displayImage,
    this.bio = "",
    this.city = "",
    this.email = "",
    this.password = "",
    this.country = "",
  }) : super(
            id: id,
            firstName: firstName,
            lastName: lastName,
            displayImage: displayImage) {
    isHost = false;
    iscurrentlyHosting = false;
  }

  // Future<void> saveUserToFirestore() async {
  //   Map<String, dynamic> dataMap = {
  //     "firstName": firstName,
  //     "lastName": lastName,
  //     "bio": bio,
  //     "city": city,
  //     "country": country,
  //     "email": email,
  //     "isHost": false,
  //     "myPostingIDs": [],
  //     "savePostingIDs": [],
  //     "earning": 0
  //   };
  //   await FirebaseFirestore.instance.collection("users").doc(id).set(dataMap);
  // }
}
