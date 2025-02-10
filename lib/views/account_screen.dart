import 'package:flutter/material.dart';
import 'package:locazen/models/app_constants.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
            )
          ],
        ),
      ),
    );
  }
}
