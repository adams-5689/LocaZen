import 'package:flutter/material.dart';
import 'package:locazen/models/user_model.dart';

class ContactModel {
  String? id;
  String? firstName;
  String? lastName;
  String? fullName;
  MemoryImage? displayImage;

  ContactModel({
    this.id = "",
    this.firstName = "",
    this.lastName = "",
    this.displayImage
  });

  String getFullNameOfUser(){
    return this.fullName = firstName! + " " + lastName!;
  }
  UserModel createUserFromContact (){
    return UserModel(id: id!,
    firstName: firstName!,
    lastName: lastName!,
    displayImage: displayImage!);
  }
}
