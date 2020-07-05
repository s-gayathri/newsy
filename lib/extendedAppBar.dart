import 'package:flutter/material.dart';
import 'package:newsy/customTabBar.dart';
import 'package:newsy/customAppBar.dart';

class ExtendedAppBar extends StatefulWidget implements PreferredSizeWidget {
  final List<String> categories;

  ExtendedAppBar(this.categories);

  @override
  _ExtendedAppBarState createState() => _ExtendedAppBarState(categories);

  @override
  Size get preferredSize {
    return Size(double.infinity, 109.6);
  }
}

class _ExtendedAppBarState extends State<ExtendedAppBar> {
  List<String> categories;

  _ExtendedAppBarState(this.categories);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        backgroundColor: const Color(0xfffffefe),
        elevation: 0,
        flexibleSpace: Column(
          children: <Widget>[CustomAppBar(), CustomTabBar(categories)],
        ),
      ),
    );
  }
}
