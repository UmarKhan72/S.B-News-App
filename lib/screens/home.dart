import 'package:flutter/material.dart';
import 'package:s.bnews/categories/topstories.dart';
import 'package:s.bnews/categories/technology.dart';
import 'package:s.bnews/categories/sport.dart';
import 'package:s.bnews/categories/headlines.dart';
import 'package:s.bnews/categories/business.dart';
import 'package:s.bnews/categories/travel.dart';
import 'package:s.bnews/categories/popular.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(75),
            child: AppBar(
              flexibleSpace: Center(
                child: Container(
                  height: 40,
                  child: Text(
                    "S.B News",
                    style: TextStyle(
                        color: Color(0xff09819c),
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              bottom: TabBar(
                isScrollable: true,
                labelColor: Color(0xff09819c),
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(text: "Top News"),
                  Tab(text: "Headlines"),
                  Tab(text: "Popular"),
                  Tab(text: "Business"),
                  Tab(text: "Travel"),
                  Tab(text: "Technology"),
                  Tab(text: "Sports"),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Topstories(),
              Headlines(),
              Popular(),
              Business(),
              Travel(),
              Technology(),
              Sports(),
            ],
          ),
        ),
      ),
    );
  }
}
