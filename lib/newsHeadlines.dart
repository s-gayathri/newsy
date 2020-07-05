import 'package:flutter/material.dart';
import 'package:newsy/news.dart';

class NewsHeadlines extends StatefulWidget {
  final String topic;
  NewsHeadlines(this.topic);

  // MAKE API REQUEST FOR THIS SPECIFIED TOPIC
  final List<News> news = News.getNews();

  @override
  _NewsHeadlinesState createState() => _NewsHeadlinesState(news);
}

class _NewsHeadlinesState extends State<NewsHeadlines> {
  List<News> news;
  _NewsHeadlinesState(this.news);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GridView.count(
      crossAxisCount: 1,
      childAspectRatio: MediaQuery.of(context).size.width /
          (MediaQuery.of(context).size.height / 3.25),
      children: news.map((headline) => _headlineTemplate(headline)).toList(),
    ));
  }

  Widget _headlineTemplate(News headline) {
    return Container(
      height: 250.0,
      margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(headline.image),
          )),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
                width: 375.0,
                height: 65.0,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    headline.title,
                    style: TextStyle(
                      fontFamily: 'Open Sans',
                      fontSize: 13,
                      color: const Color(0xff000000),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                  color: const Color(0xaaffffff),
                )),
          ),
        ],
      ),
    );
  }
}
