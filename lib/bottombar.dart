import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:s.bnews/screens/home.dart';
import 'package:s.bnews/screens/search.dart';
import 'package:s.bnews/checkuser/userprofile.dart';
import 'package:s.bnews/checkuser/userfavorite.dart';
import 'package:bottom_bars/bottom_bars.dart';

class Bottombar extends StatefulWidget {
  @override
  _BottombarState createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  @override
  Widget build(BuildContext context) {
// SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: BottomBars(
        backgroundBarColor: Colors.white,
        items: [
          BottomBarsItem(
            page: Scaffold(
              body: Home(),
            ),
            item: Item(
              activeColor: Color(0xff09819c),
              color: Colors.black,
              icon: Icons.home,
              iconSize: 33,
              title: Text("Home"),
            ),
          ),
          BottomBarsItem(
            page: Scaffold(
              body: Search(),
            ),
            item: Item(
              activeColor: Color(0xff09819c),
              color: Colors.black,
              icon: Icons.search_sharp,
              iconSize: 33,
              title: Text(
                "Search",
              ),
            ),
          ),
          BottomBarsItem(
            page: Scaffold(
              body: userfavorite(),
            ),
            item: Item(
              activeColor: Color(0xff09819c),
              color: Colors.black,
              icon: Icons.favorite,
              iconSize: 33,
              title: Text("Favorite"),
            ),
          ),
          BottomBarsItem(
            page: Scaffold(
              body: userprofile(),
            ),
            item: Item(
              activeColor: Color(0xff09819c),
              icon: Icons.person,
              iconSize: 33,
              title: Text("Profile"),
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
