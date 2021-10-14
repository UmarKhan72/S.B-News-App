import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:s.bnews/checkuser/check.dart';
import 'package:s.bnews/model/article_model.dart';
import 'package:s.bnews/article/detail.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget newscard(Article article, BuildContext context) {
  Future addTofav() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("favorites");
    return _collectionRef.doc(currentUser.email).collection("items").doc().set({
      "title": article.title,
      "images": article.urlToImage,
      "author": article.author,
    }).then(
        (value) => Fluttertoast.showToast(msg: "Article Added In favorite"));
  }

  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(
                    article: article,
                  )));
    },
    child: Container(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: (article.urlToImage == null)
                      ? AssetImage('images/back1.jpg')
                      : NetworkImage(article.urlToImage),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            article.title != null ? article.title : 'Breaking News',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
                decoration: new BoxDecoration(
                    // color: Colors.black,
                    borderRadius: new BorderRadius.circular(60)),
                child: Text(
                  article.source.name,
                  style: TextStyle(
                    color: Color(0xff09819c),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )),
          ),
          Row(children: [
            check(article, context)
            // Container(child: check(article, context)),
            // SizedBox(
            //   width: 120,
            // ),
            // Align(
            //     alignment: Alignment.bottomRight,
            //     child: Row(children: [
            //       Icon(
            //         Icons.timer,
            //         color: Colors.grey,
            //       ),
            //       SizedBox(
            //         width: 5,
            //       ),
            //       // Text(
            //       //   article.publishedAt != null
            //       //       ? article.publishedAt
            //       //       : '1 hour ago',
            //       //   style: TextStyle(
            //       //       fontWeight: FontWeight.bold,
            //       //       fontSize: 10.0,
            //       //       color: Colors.grey),
            //       // ),
            //     ])),
          ]),
          Divider(
            thickness: 3,
          )
        ],
      ),
    ),
  );
}
