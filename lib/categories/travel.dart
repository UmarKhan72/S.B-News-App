import 'package:s.bnews/api_data/api_service.dart';
import 'package:flutter/material.dart';
import 'package:s.bnews/cards/newscard.dart';
import 'package:s.bnews/model/article_model.dart';

class Travel extends StatefulWidget {
  @override
  _TravelState createState() => _TravelState();
}

class _TravelState extends State<Travel> {
  TravelApi client = TravelApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article> articles = snapshot.data;
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) =>
                  newscard(articles[index], context),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}