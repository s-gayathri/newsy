import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Hyperlink extends StatelessWidget {
  final String url;
  final String text;

  Hyperlink({this.url, this.text});

  _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        text,
        style: TextStyle(
          decoration: TextDecoration.underline,
          fontFamily: 'Open Sans',
          fontSize: 14,
          color: const Color(0xff000000),
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w800,
        ),
      ),
      onTap: _launchURL,
    );
  }
}
