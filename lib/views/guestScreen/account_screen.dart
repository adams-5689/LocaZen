import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locazen/app_decoration.dart';
import 'package:locazen/global.dart';
import 'package:locazen/models/app_constants.dart';
import 'package:locazen/views/guest_home_screen.dart';
import 'package:locazen/views/host_home_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String _hostingTitle = "Show mys host dashboard";

  modifieHostingMode() async {
    if (AppConstants.currentUser.isHost!) {
      if (AppConstants.currentUser.iscurrentlyHosting!) {
        AppConstants.currentUser.iscurrentlyHosting = false;
        Get.to(GuestHomeScreen());
      } else {
        AppConstants.currentUser.iscurrentlyHosting = true;
        Get.to(HostHomeScreen());
      }
    } else {
      await userViewModel.becomeHost(FirebaseAuth.instance.currentUser!.uid);
      AppConstants.currentUser.iscurrentlyHosting = true;
      Get.to(HostHomeScreen());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (AppConstants.currentUser.isHost!) {
      if (AppConstants.currentUser.iscurrentlyHosting!) {
        _hostingTitle = "Show mys Guest dashboard";
      } else {
        _hostingTitle = "Show mys host dashboard";
      }
    } else {
      _hostingTitle = "Become Host";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(25, 50, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //user info
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Center(
                  child: Column(
                children: [
                  MaterialButton(
                    onPressed: () {},
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: MediaQuery.of(context).size.width / 4.5,
                      child: CircleAvatar(
                        backgroundImage: AppConstants.currentUser.displayImage,
                        radius: MediaQuery.of(context).size.width / 4.6,
                      ),
                    ),
                  ),

                  // name and email
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppConstants.currentUser.getFullNameOfUser(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          AppConstants.currentUser.getFullNameOfUser(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          AppConstants.currentUser.email.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        )
                      ])
                ],
              )),
            ),
            //Buttons
            ListView(
              shrinkWrap: true,
              children: [
                //button pour information personnel
                Container(
                  decoration: AppDecoration.gradientBoxDecoration,
                  child: MaterialButton(
                    onPressed: () {},
                    height: MediaQuery.of(context).size.width / 9.1,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0.0),
                      leading: Text(
                        "Information Personnel",
                        style: TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      trailing: Icon(
                        size: 34,
                        Icons.person_2,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                //Button de changement de mode
                Container(
                  decoration: AppDecoration.gradientBoxDecoration,
                  child: MaterialButton(
                    onPressed: () {
                      modifieHostingMode();
                    },
                    height: MediaQuery.of(context).size.width / 9.1,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0.0),
                      leading: Text(
                        _hostingTitle,
                        style: TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      trailing: Icon(
                        size: 34,
                        Icons.hotel_outlined,
                      ),
                    ),
                  ),
                ),

                //logout btn

                SizedBox(
                  height: 10,
                ),

                Container(
                  decoration: AppDecoration.gradientBoxDecoration,
                  child: MaterialButton(
                    onPressed: () {},
                    height: MediaQuery.of(context).size.width / 9.1,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0.0),
                      leading: Text(
                        "Deconnxion",
                        style: TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      trailing: Icon(
                        size: 34,
                        Icons.login_outlined,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
