import 'package:flutter/material.dart';
import 'package:newsy/components/customAppBar.dart';
import 'package:newsy/components/customBottomBar.dart';
import 'package:newsy/components/newsHeadlines.dart';

Map data = {};

class SearchResults extends StatelessWidget {
  final String query;

  SearchResults({this.query});

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: const Color(0xfffcda92),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 128.0),
        child: Container(
          child: AppBar(
            leading: Container(),
            backgroundColor: const Color(0xfffffefe),
            elevation: 0,
            flexibleSpace: Column(
              children: <Widget>[
                CustomAppBar(),
                ListTile(
                    title: Text(
                      'News articles related to ` ${data['query']} `',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 17,
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    leading: BackButton()),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: PreferredSize(
          child: CustomBottomBar(), preferredSize: Size(double.infinity, 50)),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color(0xfffcda92), const Color(0xfff9e9c6)],
            begin: FractionalOffset.bottomCenter,
            end: FractionalOffset.topCenter,
            tileMode: TileMode.clamp,
          ),
        ),
        child: NewsHeadlines(
          topic: data['query'],
          search: true,
        ),
      ),
    );
  }
}
