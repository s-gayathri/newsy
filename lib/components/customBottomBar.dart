import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  @override
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/settings'),
              icon: Icon(
                Icons.settings,
                size: 30.0,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 10,
            ),
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/home'),
              icon: Icon(
                Icons.dashboard,
                size: 30.0,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 10,
            ),
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/search'),
              icon: Icon(
                Icons.search,
                size: 30.0,
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: const Color(0xfffffefe),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
      ),
    );
  }
}
