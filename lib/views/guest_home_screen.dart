import 'package:flutter/material.dart';
import 'package:locazen/colors_app.dart';
import 'package:locazen/views/guestScreen/account_screen.dart';
import 'package:locazen/views/guestScreen/explore_screen.dart';
import 'package:locazen/views/guestScreen/inbox_screen.dart';
import 'package:locazen/views/guestScreen/saved_listings_screen.dart';
import 'package:locazen/views/guestScreen/trips_screen.dart';

class GuestHomeScreen extends StatefulWidget {
  const GuestHomeScreen({super.key});

  @override
  State<GuestHomeScreen> createState() => _GuestHomeScreenState();
}

class _GuestHomeScreenState extends State<GuestHomeScreen> {
  ColorsApp colorsApp = ColorsApp();
  int selectedIndex = 0;
  final List<String> screenTitle = [
    'Explore',
    'Save',
    'Trip',
    'Inbox',
    'Profile'
  ];

  final List<Widget> screens = [
    ExploreScreen(),
    SavedListingsScreen(),
    TripsScreen(),
    InboxScreen(),
    AccountScreen(),
  ];

  BottomNavigationBarItem customNavigationBarItem(
      int index, IconData iconData, String title) {
    return BottomNavigationBarItem(
      icon: Icon(iconData, color: Colors.black),
      activeIcon: Icon(iconData, color: Colors.deepPurple),
      label: title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.pinkAccent, Colors.amber],
                  begin: FractionalOffset(0, 0),
                  end: FractionalOffset(1, 0),
                  stops: [0, 1],
                  tileMode: TileMode.clamp)),
        ),
        title: Text(
          screenTitle[selectedIndex],
          style: TextStyle(
            fontSize: 10,
            color: colorsApp.colorsTextAppBar,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) {
          setState(() {
            selectedIndex = i;
          });
        },
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          customNavigationBarItem(0, Icons.search, screenTitle[0]),
          customNavigationBarItem(1, Icons.favorite_border, screenTitle[1]),
          customNavigationBarItem(2, Icons.hotel, screenTitle[2]),
          customNavigationBarItem(3, Icons.message, screenTitle[3]),
          customNavigationBarItem(4, Icons.person_outline, screenTitle[4]),
        ],
      ),
    );
  }
}
