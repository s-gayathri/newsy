import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  final List<String> categories;

  CustomTabBar(this.categories);

  @override
  _CustomTabBarState createState() => _CustomTabBarState(categories);
}

class _CustomTabBarState extends State<CustomTabBar> {
  List<String> categories;

  _CustomTabBarState(this.categories);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      indicatorWeight: 5.0,
      indicatorColor: Colors.black,
      labelColor: Colors.black,
      labelStyle: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 17,
        color: const Color(0xff000000),
        fontWeight: FontWeight.w900,
      ),
      unselectedLabelColor: Colors.black,
      unselectedLabelStyle: TextStyle(
        fontFamily: 'Roboto',
        fontSize: 11,
        color: const Color(0xff000000),
        fontWeight: FontWeight.w900,
      ),
      tabs: categories
          .map((category) => Container(
                height: 35.0,
                child: Tab(text: category),
              ))
          .toList(),
    );
  }
}
