import 'package:flutter/material.dart';
import 'package:newsy/components/headlineTemplate.dart';
import 'package:newsy/models/article.dart';
import 'package:newsy/models/headline.dart';
import 'package:newsy/services/news.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsHeadlines extends StatefulWidget {
  final String topic;
  final bool search;
  NewsHeadlines({this.topic, this.search});

  @override
  _NewsHeadlinesState createState() =>
      _NewsHeadlinesState(topic: topic, search: search);
}

class _NewsHeadlinesState extends State<NewsHeadlines> {
  final String topic;
  List<Article> articles;
  List<Headline> headlines;
  List<String> preferences, temp;
  bool error, search;
  SharedPreferences prefs;

  _NewsHeadlinesState({this.topic, this.search});

  Future<void> setupNews() async {
    try {
      prefs = await SharedPreferences.getInstance();
      temp = prefs.getStringList('preferences');

      News instance = News(topic: topic, preferences: temp, search: search);
      await instance.getNews();

      if (mounted)
        setState(() {
          articles = instance.articles;
          headlines = instance.headlines;
          preferences = temp;
        });
    } catch (err) {
      print('Error: $err');
      setState(() {
        articles = null;
        headlines = null;
        error = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      articles = null;
      headlines = null;
      error = false;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setupNews();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (error == true)
      return Center(
          child: Text(
        'Unexpected error caught...',
        style: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 13,
          color: const Color(0xff000000),
          fontWeight: FontWeight.w600,
        ),
      ));

    if (headlines == null || articles == null)
      return Center(
          child: Text(
        'Loading...',
        style: TextStyle(
          fontFamily: 'Open Sans',
          fontSize: 13,
          color: const Color(0xff000000),
          fontWeight: FontWeight.w600,
        ),
      ));

    return SafeArea(
      child: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 3.25),
        children: headlines
            .asMap()
            .entries
            .map(
              (headline) => GestureDetector(
                child: HeadlineTemplate(
                  headline: headline.value,
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/news-article',
                    arguments: {'article': articles[headline.key]},
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
