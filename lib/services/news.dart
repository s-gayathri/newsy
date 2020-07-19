import 'package:http/http.dart';
import 'dart:convert';
import 'package:newsy/models/article.dart';
import 'package:newsy/models/headline.dart';
import 'package:shared_preferences/shared_preferences.dart';

class News {
  String topic;
  String url;
  String apiKey = '&apiKey=b42dd0c6dcfe4ad19789e8c99ae49818';
  String pub = '', author = '', category = '';
  List<Article> articles = [];
  List<Headline> headlines = [];
  List<String> preferences;
  bool search;
  Map news = {};
  SharedPreferences prefs;
  News({this.topic, this.preferences, this.search});

  void setURL() async {
    print(search);
    if (topic == 'General')
      url =
          'top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en';
    else if (topic == 'Favorites') {
      print('News.dart $preferences');

      category = preferences[0];
      for (int i = 1; i < preferences.length; i++)
        category = '$category OR ${preferences[i]}';

      url =
          'everything?q=$category&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en';
    } else if (search == true) {
      print("inside search");
      url =
          'everything?q=$topic&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en';
    } else
      url =
          'top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&category=$topic';
  }

  Future<void> getNews() async {
    setURL();
    Response response = await get('https://newsapi.org/v2/$url$apiKey');
    news = jsonDecode(response.body);

    if (news['status'] == 'ok') {
      print('$url: ${news['articles'].length}');
      news['articles'].forEach((element) {
        if (element['publishedAt'] != null)
          pub =
              'Published At: ${DateTime.parse(element['publishedAt']).toString()}';
        else
          pub = '';

        if (element['author'] != null)
          author = 'Author: ${element['author']}';
        else
          author = '';

        Article article = Article(
          title: element['title'],
          author: author,
          description: element['description'] ?? '',
          urlToImage: element['urlToImage'] ??
              'https://worldofspectrum.org/addons/shared_addons/themes/bootstrap/img/image-not-available.png',
          publishedAt: pub,
          content: element["content"] ?? 'View content at link provided below.',
          articleUrl: element["url"] ?? 'URL to article not available!',
        );

        articles.add(article);

        Headline headline = Headline(
          title: element['title'],
          urlToImage: element['urlToImage'] ??
              'https://worldofspectrum.org/addons/shared_addons/themes/bootstrap/img/image-not-available.png',
        );

        headlines.add(headline);
      });
    }
  }
}
