import 'package:flutter/material.dart';
import 'package:newsy/components/customBottomBar.dart';
import 'package:newsy/components/extendedAppBar.dart';
import 'package:newsy/components/newsHeadlines.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList>
    with SingleTickerProviderStateMixin {
  TabController controller;

  final List<String> categories = [
    'Favorites',
    'General',
    'Sports',
    'Business',
    'Finance',
    'Entertainment',
    'Technology',
    'Science',
    'Fashion',
    'Health',
    'Education',
    'Politics',
    'Government'
  ];

  @override
  void initState() {
    controller = new TabController(vsync: this, length: categories.length);
    controller.index = 1;
    setState(() {});
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: categories.length,
        child: Scaffold(
          backgroundColor: const Color(0xfffcda92),
          appBar: ExtendedAppBar(categories),
          bottomNavigationBar: PreferredSize(
              child: CustomBottomBar(),
              preferredSize: Size(double.infinity, 50)),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [const Color(0xfffcda92), const Color(0xfff9e9c6)],
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter,
                tileMode: TileMode.clamp,
              ),
            ),
            child: TabBarView(
                children: categories
                    .map((category) => NewsHeadlines(
                          topic: category,
                          search: false,
                        ))
                    .toList()),
          ),
        ));
  }
}
