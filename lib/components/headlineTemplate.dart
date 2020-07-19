import 'package:flutter/material.dart';
import 'package:newsy/models/headline.dart';

class HeadlineTemplate extends StatelessWidget {
  final Headline headline;

  HeadlineTemplate({this.headline});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(headline.urlToImage),
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
