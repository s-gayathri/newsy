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
        // margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '1',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            Text(
              '2',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            Text(
              '3',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 25,
                color: Colors.black,
              ),
            ),
            Text(
              '4',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 25,
                color: Colors.black,
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
