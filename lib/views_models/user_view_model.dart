import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:locazen/models/app_constants.dart';

class UserViewModel {
  signUp(email, password, firstName, lastName, city, country, bio,
      imageFileOfUser) async {
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
          .whenComplete(() {});
    });
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
}
