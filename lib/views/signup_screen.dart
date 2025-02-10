import 'package:flutter/material.dart';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:locazen/global.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController =
      TextEditingController();
  TextEditingController _firstNameTextEditingController =
      TextEditingController();
  TextEditingController _cityTextEditingController = TextEditingController();
  TextEditingController _lastNameTextEditingController =
      TextEditingController();
  TextEditingController _bioTextEditingController = TextEditingController();
  TextEditingController _countryTextEditingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? imageFileOfUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.pinkAccent, Colors.amber],
                begin: FractionalOffset(0, 0),
                end: FractionalOffset(1, 0),
                stops: [0, 1],
                tileMode: TileMode.clamp),
          ),
        ),
        title: const Text(
          "Create new account",
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.pinkAccent, Colors.amber],
                begin: FractionalOffset(0, 0),
                end: FractionalOffset(1, 0),
                stops: [0, 1],
                tileMode: TileMode.clamp)),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Image.asset(
                "images/signup.png",
                width: 240,
              ),
            ),
            Text(
              "Tell us about you",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.pink,
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 21),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "First Name",
                        ),
                        style: TextStyle(
                          fontSize: 24,
                        ),
                        controller: _firstNameTextEditingController,
                        validator: (text) {
                          if (text!.isEmpty) {
                            return "Please enter a first name";
                          }
                          {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 21),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Last Name",
                        ),
                        style: TextStyle(
                          fontSize: 24,
                        ),
                        controller: _lastNameTextEditingController,
                        validator: (text) {
                          if (text!.isEmpty) {
                            return "Please enter a last name";
                          }
                          {
                            return null;
                          }
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 21),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "City",
                        ),
                        style: TextStyle(
                          fontSize: 24,
                        ),
                        controller: _cityTextEditingController,
                        validator: (text) {
                          if (text!.isEmpty) {
                            return "Please enter a city";
                          }
                          {
                            return null;
                          }
                        },
                      ),
                    ),
                    //Country
                    Padding(
                      padding: const EdgeInsets.only(top: 21),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Country",
                        ),
                        style: TextStyle(
                          fontSize: 24,
                        ),
                        controller: _countryTextEditingController,
                        validator: (text) {
                          if (text!.isEmpty) {
                            return "Please write your country name";
                          }
                          {
                            return null;
                          }
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 26),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Email",
                        ),
                        style: TextStyle(
                          fontSize: 24,
                        ),
                        controller: _emailTextEditingController,
                        validator: (valueEmail) {
                          if (!valueEmail!.contains("@")) {
                            return "Please writ valid email..";
                          }
                          {
                            return null;
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 21),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Password",
                        ),
                        style: TextStyle(
                          fontSize: 24,
                        ),
                        controller: _passwordTextEditingController,
                        obscureText: true,
                        validator: (valuePassword) {
                          if (valuePassword!.length < 6) {
                            return "Please writ password length more 6..";
                          }
                          {
                            return null;
                          }
                        },
                      ),
                    ),
                    //bio
                    Padding(
                      padding: const EdgeInsets.only(top: 21),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Bio",
                        ),
                        style: TextStyle(
                          fontSize: 24,
                        ),
                        controller: _bioTextEditingController,
                        validator: (text) {
                          if (text!.isEmpty) {
                            return "Please enter a bio";
                          }
                          {
                            return null;
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: MaterialButton(
                onPressed: () async {
                  var imageFile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (imageFile != null) {
                    imageFileOfUser = File(imageFile.path);
                    setState(() {
                      imageFileOfUser;
                    });
                  }
                },
                child: imageFileOfUser == null
                    ? Icon(Icons.add_a_photo)
                    : CircleAvatar(
                        backgroundColor: Colors.pink,
                        radius: MediaQuery.of(context).size.width / 5.0,
                        child: CircleAvatar(
                          backgroundImage: FileImage(imageFileOfUser!),
                          radius: MediaQuery.of(context).size.width / 5.0,
                        ),
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 26, right: 40, left: 40),
              child: ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate() ||
                        imageFileOfUser == null) {
                      Get.snackbar("Field missing",
                          "please choose image and fill out complate sing up form");
                      return;
                    }
                    if (!_emailTextEditingController.text.isEmpty &&
                        _passwordTextEditingController.text.isEmpty) {
                      Get.snackbar(
                          "Field missing", "please write email and password");
                      return;
                    }

                    userViewModel.signUp(
                        _emailTextEditingController.text.trim(),
                        _passwordTextEditingController.text.trim(),
                        _firstNameTextEditingController.text.trim(),
                        _lastNameTextEditingController.text.trim(),
                        _cityTextEditingController.text.trim(),
                        _countryTextEditingController.text.trim(),
                        _bioTextEditingController.text.trim(),
                        imageFileOfUser);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                  ),
                  child: const Text(
                    "Creer un compte",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
