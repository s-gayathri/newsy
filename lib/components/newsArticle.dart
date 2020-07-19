import 'package:flutter/material.dart';
import 'package:newsy/components/customAppBar.dart';
import 'package:newsy/components/customBottomBar.dart';
import 'package:newsy/models/article.dart';
import 'package:newsy/services/hyperlink.dart';

Map data = {};

class NewsArticle extends StatelessWidget {
  final Article article;

  NewsArticle({this.article});

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: const Color(0xfffcf0c2),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 120.0),
        child: Container(
          child: AppBar(
            leading: Container(),
            backgroundColor: const Color(0xfffffefe),
            elevation: 0,
            flexibleSpace: Column(
              children: <Widget>[
                CustomAppBar(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: BackButton(
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: PreferredSize(
          child: CustomBottomBar(), preferredSize: Size(double.infinity, 50)),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(-10.0),
              bottomLeft: Radius.circular(-10.0)),
          gradient: LinearGradient(
            colors: [const Color(0xfffcf0c2), const Color(0xfffffbed)],
            begin: FractionalOffset.bottomCenter,
            end: FractionalOffset.topCenter,
            tileMode: TileMode.clamp,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.all(20.0),
          shrinkWrap: true,
          children: <Widget>[
            Text(
              data['article'].title,
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 23,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 30),
            Image.network(data['article'].urlToImage),
            SizedBox(height: MediaQuery.of(context).size.height / 60),
            Text(
              data['article'].publishedAt,
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 13,
                color: const Color(0xff000000),
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 30),
            Text(
              data['article'].description,
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 15,
                color: const Color(0xff000000),
                fontWeight: FontWeight.w800,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 30),
            Text(
              data['article'].content,
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 19,
                color: const Color(0xff000000),
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 60),
            Hyperlink(
              url: data['article'].articleUrl,
              text: 'Click this link to find the original article',
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 30),
            Text(
              data['article'].author,
              style: TextStyle(
                fontFamily: 'Open Sans',
                fontSize: 13,
                color: const Color(0xff000000),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
